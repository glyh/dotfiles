#!/usr/bin/env bash
AddPackage nvidia-open
AddPackage nvidia-utils
AddPackage lib32-nvidia-utils
AddPackage --foreign libva-vdpau-driver-vp9-git # VDPAU backend for VA API. (Version with

# Pin CUDA tool chains to a specific version
IgnorePackage gcc11
IgnorePackage gcc11-libs
IgnorePackage cuda
