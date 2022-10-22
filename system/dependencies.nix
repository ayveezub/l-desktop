{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # The set of packages that appear in `/run/current-system/sw`.
  # These packages are automatically available to all users,
  # and are automatically updated every time you rebuild the system configuration.
  # (The latter is the main difference with installing them in the default profile,
  # `/nix/var/nix/profiles/default`.
  environment.systemPackages = with pkgs; [
    cairo # a 2D graphics library with support for multiple output devices
    libappindicator-gtk3 # a library to allow applications to export a menu into the Unity Menu bar
    libappindicator-gtk2 # a library to allow applications to export a menu into the Unity Menu bar
    libhandy # building blocks for modern adaptive GNOME apps
    libstatgrab # a library that provides cross platforms access to statistics about the running system
    lxqt.libsysstat # library used to query system info and statistics
    lz4 # extremely fast compression algorithm
    ncurses # free software emulation of curses in SVR4 and more
    ntfs3g # FUSE-based NTFS driver with full write support
    pango # a library for laying out and rendering of text, with an emphasis on internationalization
    sshfs # FUSE-based filesystem that allows remote filesystems to be mounted over SSH
    zlib # lossless data-compression library
  ];
}
