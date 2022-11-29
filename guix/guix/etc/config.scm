;; This is an operating system configuration template
;; for a "desktop" setup with GNOME and Xfce where the
;; root partition is encrypted with LUKS, and a swap file.

(use-modules (gnu) (gnu system nss) (guix utils))
(use-modules (nongnu packages linux) (nongnu system linux-initrd))

(use-service-modules desktop sddm xorg)
(use-package-modules certs gnome)

(define vol-home
  (file-system
    (type "btrfs")
    (device (file-system-label "HOME"))
    (mount-point "/home")
    (options "subvol=@home")))

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  (host-name "antelope")
  (timezone "America/Los_Angeles")
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
  ;; nvme0n1p1 -> boot
  ;; nvme0n1p2 -> root
  ;; nvme0n1p2 -> home
  ;; nvme0n1p4 -> swap
  (file-systems (append
                 (list (file-system
                         (device (file-system-label "ROOT"))
                         (mount-point "/")
                         (type "ext4"))
                       vol-home
                       (file-system
                         (device (file-system-label "BOOT"))
                         (mount-point "/boot/efi")
                         (type "vfat")))
                 %base-file-systems))

  (swap-devices (list (swap-space (target "/dev/nvme0n1p4"))))

  ;; Create user `bob' with `alice' as its initial password.
  (users (cons (user-account
                (name "lyh")
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
  (services 
                (append (list (service gnome-desktop-service-type)
                              (service xfce-desktop-service-type)
                              (set-xorg-configuration
                               (xorg-configuration
                                (keyboard-layout keyboard-layout))))
                        (modify-services %desktop-services
                           (guix-service-type config => (guix-configuration 
                                                         (inherit config)
                                                         (substitute-urls 
                                                           (append (list "https://substitutes.nonguix.org") %default-substitute-urls))
                                                         (authorized-keys
                                                           (append (list (local-file "./signing-key.pub")) %default-authorized-guix-keys)))))))



  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
