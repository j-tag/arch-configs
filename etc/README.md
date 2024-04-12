# Config Files in `/etc` Directory

All of the files here can be found in your `/etc` dir of an Arch installation. You should apply changes only.

## makepkg.conf

In this file I'll add the `-j$(nproc)` flag to `MAKEFLAGS` to allow `makepkg` to build AUR packages in parallel.

## pacman.conf

In this file I'll update `ParallelDownloads` flag to `5` to allow **pacman** to download files in parallel. Useful for fast network connections.  
