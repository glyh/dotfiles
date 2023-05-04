#!/usr/bin/env bb
;; vim: set ft=clojure:

(require '[babashka.fs :as fs])
(require '[clojure.string :as str])
(require '[babashka.process :refer [shell sh]])

(defn ensure-parent-delete-file [path]
  (let [par (fs/parent path)]
    (when-not (fs/exists? par)
      (println "Creating parent folders for " (.toString path))
      (fs/create-dirs (fs/parent path))))
  ;; TODO: backup
  (cond 
    (fs/sym-link? path) (do (println "Deleting" (.toString path)) (fs/delete path))
    (fs/exists? path) (do (println "Deleting" (.toString path)) (fs/delete-tree path))))

(defn link [lnk src]
  (ensure-parent-delete-file lnk)
  (println "Creating link" (.toString lnk) "of" (.toString src))
  (fs/create-sym-link lnk src))
(defn links [map]
  (doseq [[lnk src] map]
    (link lnk src)))

(defn clone [url dest]
  (ensure-parent-delete-file dest)
  (shell "git clone" url dest))

(def env #(System/getenv %1))

(def config-dir
  (or (env "XDG_CONFIG_HOME") 
      (str (env "HOME") "/.config")))

(def | fs/path)
(def script-dir (fs/parent *file*))
(defn hom [name] (| (env "HOME") name))
(defn cfg [name] (| config-dir name))
(defn dot [name] (| script-dir "dots" name))
(defn sys [name] (| script-dir "sys" name))
(defn res [name] (| script-dir "res" name))

(defn read-list [path]
  (->> path
    fs/read-all-lines
    (str/join "\n")
    (#(str/split %1 #"( |(#.*)?\n)+"))
    (filter (partial not= ""))))

;; ---- Individual softwares ----

(defn fish []
  (link (cfg "fish") (dot "fish"))
  (shell  
    "fish -c 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher'"))

(defn aria2 []
  (clone "https://github.com/P3TERX/aria2.conf.git" (hom ".aria2"))
  (shell "touch " (str (env "HOME") "/.aria2/aria2.session"))
  (link (hom ".aria2/aria2.conf") (dot "aria2/aria2.conf")))

(defn mpd []
  (let [mpd-dir (dot "mpd")]
    (link (cfg "mpd") mpd-dir)
    ; (shell "mkdir " (| mpd-dir "playlists"))
    (shell "touch " (| mpd-dir "database"))))

(defn electron []
  (links
    {(cfg "electron-flags.conf")   (dot "electron/electron-flags.conf")
     (cfg "electron12-flags.conf") (dot "electron/electron-flags.conf")
     (cfg "electron13-flags.conf") (dot "electron/electron-flags.conf")
     (cfg "chromium-flags.conf") (dot "electron/electron-flags.conf")}))

(defn kitty []
  (link (cfg "kitty") (dot "kitty"))
  (clone "https://github.com/dexpota/kitty-themes.git" (cfg "kitty/kitty-themes"))
  (link (cfg "kitty/theme.conf") (cfg "kitty/kitty-themes/themes/Apprentice.conf")))

(defn neovim []
  (link (cfg "nvim") (dot "neovim"))
  (println "Clearing neovim cache")
  (fs/delete-tree (| (env "HOME") ".local/share/nvim"))
  (fs/delete-tree (| (env "HOME") ".cache/nvim"))
  (fs/delete-tree (cfg "nvim/plugin"))
  (println "PackerSyncing")
  (shell "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"))

;; ---- Groups ----

(defn base []
  (println "Setting up base")
  (links 
    {(hom "Binaries")  (| script-dir "bin")
     (cfg "fish")     (dot "fish")
     (cfg "git")      (dot "git")
     (hom ".inputrc") (dot "readline/.inputrc")
     (hom ".profile") (dot "session/.profile")})
  (neovim) (fish) (electron))

(defn de []
  (println "Setting up DE")
  (links 
    {(hom "Pictures/Wallpapers") (res "wallpapers")
     (cfg "sway")                (dot "sway")
     (cfg "kanshi")              (dot "kanshi")
     (cfg "tofi")                (dot "tofi")
     (cfg "river")               (dot "river")
     (cfg "swaylock")            (dot "swaylock")
     (cfg "waybar")              (dot "waybar")
     (cfg "mako")                (dot "mako")
     (cfg "ulauncher")           (dot "ulauncher")})
  (kitty))

(defn tools []
  (println "Setting up tools")
  (links
    {(cfg "ranger")       (dot "ranger")
     (cfg "tealdeer")     (dot "tealdeer")
     (cfg "bat")          (dot "bat")
     (cfg "starship")     (dot "starship")
     (hom ".proxychains") (dot "proxychains")
     (cfg "kmonad")       (dot "kmonad")
     (hom ".haskeline")   (dot "ghc/.haskeline")})
  (aria2) (mpd))

(defn softwares []
  (println "Setting up softwares")
  (links {(cfg "zathura") (dot "zathura")
          (cfg "fcitx5")  (dot "fcitx5")}))

(defn package-managers []
  (println "Setting up package-managers")
  (links 
    {(cfg "cargo/config.toml") (dot "cargo/config.toml")}))

(defn dots []
  (println "Setting up all dotfiles")
  (base) (de) (tools) (softwares) (package-managers))

(defn installed? [package]
  (try (shell {:out nil} "pacman -Qi " package) 
    true
    (catch Exception _ false)))

(defn ensure-paru []
  (when-not (installed? "paru-bin")
    (let [paru-bin (.toString (fs/create-temp-dir))]
      ; (shell "sudo pacman -S --needed --noconfirm base-devel")
      (clone "https://aur.archlinux.org/paru-bin.git" paru-bin)
      (shell {:dir paru-bin} "makepkg -si --noconfirm"))))

(defn pkgs []
  (shell "sudo pacman -Sy")
  (ensure-paru)
  (let [packages (read-list (sys "packages"))]
    (apply shell "paru -S --needed --noconfirm" packages)))

(defn svs []
  (let [services (read-list (sys "services"))]
    (apply shell "systemctl enable " services)))

(defn grps []
  #_(let [user (:out (sh "whoami"))
          [primary-group & rest-groups :as all-groups] (read-list (sys "groups"))]
      (doseq [g all-groups]
        (shell (str "sudo groupadd " g " | true")))
      (shell "sudo usermod -g" primary-group user)
      (doseq [g rest-groups]
        (shell "sudo usermod -a -G" g user))))

;; (defn sysfiles [])

;; (sysfiles) (grps) (pkgs) (dots) (svs)
(dots)
;; (mpd)
