#!/usr/bin/env bash
IgnorePath '/nix/*'
IgnorePath '/var/*'
IgnorePath '/opt/*'
IgnorePath '/usr/*'
IgnorePath '/boot/*'
IgnorePath '/lost+found/*'
IgnorePath '/.sentry-native/*'

IgnorePath '/etc/*-' # backups
IgnorePath '/etc/fstab'
IgnorePath '/etc/.updated'
IgnorePath '/etc/ld.so.cache'
IgnorePath '/etc/ssl/certs/*'
IgnorePath '/etc/uuplugin/*'
IgnorePath '/etc/pacman.d/gnupg/*'
IgnorePath '/etc/ca-certificates/*'
IgnorePath '/etc/passwd.OLD'
IgnorePath '/etc/v2raya/*.db'
IgnorePath '/etc/NetworkManager/system-connections'
IgnorePath '/etc/uu'

# Credentials & Privilege
IgnorePath '/etc/passwd'
IgnorePath '/etc/shadow'
IgnorePath '/etc/group'
IgnorePath '/etc/gshadow'

IgnorePath '/**/*.pacsave'
IgnorePath '/**/*.pacnew'
IgnorePath '/**/*.pacsave.[0-9]'
