# Config Files in `/etc` Directory

All of the files here can be found in your `/etc` dir of an Arch installation. You should apply changes only.

## doas.conf

In this file I'll allow `jtag` user to keep its password for doas for a while when password is entered correctly.
Also I'll give the ability to `jtag` to run `docker` commands without any password.

## hosts

My typical `hosts` file.

## makepkg.conf

In this file I'll add the `-j$(nproc)` flag to `MAKEFLAGS` to allow `makepkg` to build AUR packages in parallel.

## pacman.conf

In this file I'll update `ParallelDownloads` flag to `5` to allow **pacman** to download files in parallel. Useful for fast network connections.  
