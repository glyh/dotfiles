;; This is an operating system configuration template
;; for a "desktop" setup with GNOME and Xfce where the
;; root partition is encrypted with LUKS, and a swap file.


(use-modules (gnu) 
             (gnu system nss) 
             (guix utils))
(use-modules (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules desktop sddm xorg)
(use-package-modules certs gnome)

(define %custom-services
  (modify-services %desktop-services
    ;; Hydra server is offline so i use berlin server for substitutes
    (guix-service-type config =>
      (guix-configuration
        (inherit config)
        (substitute-urls (cons "https://mirror.sjtu.edu.cn/guix/" %default-substitute-urls))))))

(define vol-root
  (file-system
    (type "btrfs")
    (device (file-system-label "ROOT"))
    (mount-point "/")
    (options "subvol=@")))

(define vol-store
  (file-system
    (type "btrfs")
    (device (file-system-label "ROOT"))
    (mount-point "/gnu/store")
    (options "subvol=@guix-store")))

(define vol-home
  (file-system
    (type "btrfs")
    (device (file-system-label "ROOT"))
    (mount-point "/home")
    (options "subvol=@home")))

(operating-system
  
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (cons* realtek-firmware %base-firmware))

  (host-name "antelope")
  (timezone "Asia/Shanghai")
  (locale "en_US.utf8")

  ;; Choose US English keyboard layout.  The "altgr-intl"
  ;; variant provides dead keys for accented characters.
  (keyboard-layout (keyboard-layout "us" "altgr-intl"))

  ;; Use the UEFI variant of GRUB with the EFI System
  ;; Partition mounted on /boot/efi.
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets '("/boot/efi"))
                (keyboard-layout keyboard-layout)))

  (file-systems (append
                 (list  
                   vol-root
                   vol-store
                   vol-home
                   (file-system
                     (device (file-system-label "EFI"))
                     (mount-point "/boot/efi")
                     (type "vfat")))
                 %base-file-systems))

  ;; Specify a swap file for the system, which resides on the
  ;; root file system.
  (swap-devices (list (swap-space (target "/dev/sda2"))))

  ;; Create user `bob' with `alice' as its initial password.
  (users (cons (user-account
                (name "lyh")
                (password #f)
                (group "wheel")
                (supplementary-groups '("netdev"
                                        "audio" "video")))
               %base-user-accounts))

  ;; This is where we specify system-wide packages.
  (packages (append (list
                     ;; for HTTPS access
                     nss-certs
                     ;; for user mounts
                     gvfs)
                    %base-packages))

  ;; Add GNOME and Xfce---we can choose at the log-in screen
  ;; by clicking the gear.  Use the "desktop" services, which
  ;; include the X11 log-in service, networking with
  ;; NetworkManager, and more.
  (services (if (target-x86-64?)
                (append (list (service gnome-desktop-service-type)
                              (service xfce-desktop-service-type)
                              (set-xorg-configuration
                               (xorg-configuration
                                (keyboard-layout keyboard-layout))))
                        %custom-services)

                ;; FIXME: Since GDM depends on Rust (gdm -> gnome-shell -> gjs
                ;; -> mozjs -> rust) and Rust is currently unavailable on
                ;; non-x86_64 platforms, we use SDDM and Mate here instead of
                ;; GNOME and GDM.
                (append (list (service mate-desktop-service-type)
                              (service xfce-desktop-service-type)
                              (set-xorg-configuration
                               (xorg-configuration
                                (keyboard-layout keyboard-layout))
                               sddm-service-type))
                        %custom-services)))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
