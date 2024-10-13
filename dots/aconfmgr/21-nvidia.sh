#!/usr/bin/env bash
AddPackage nvidia-open
AddPackage nvidia-utils
AddPackage lib32-nvidia-utils

# Pin CUDA tool chains to a specific version
IgnorePackage gcc11
IgnorePackage gcc11-libs
IgnorePackage cuda
