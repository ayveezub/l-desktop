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
    unstable.alacritty # a cross-platform, GPU-accelerated terminal emulator
    dmenu # a generic, highly customizable, and efficient menu for the X Window System
    libsForQt5.konsole # KDE terminal emulator
    unstable.leftwm # a tiling window manager for the adventurer written in Rust
    lxqt.qps # Qt based process manager
    unstable.rofi # window switcher, run dialog and dmenu replacement
    xidlehook # xautolock rewrite in Rust, with a few extra features

    # Archiving:
    lxqt.lxqt-archiver # archive tool for the LXQt desktop environment

    # Audio:
    flacon # extracts audio tracks from an audio CD image to separate tracks
    strawberry # music player and music collection organizer

    # Dev:
    libsForQt5.kcalc # scientific calculator

    # FS:
    lxqt.pcmanfm-qt # file manager and desktop icon manager (Qt port of PCManFM and libfm)

    # Git:
    delta # a syntax-highlighting pager for git
    git # distributed version control system
    tig # text-mode interface for git

    # Image:
    feh # a light-weight image viewer
    qimgv # a Qt5 image viewer with optional video support
    lxqt.screengrab # crossplatform tool for fast making screenshots

    # Info:
    mediainfo # supplies technical and tag information about a video or audio file

    # Text:
    libsForQt5.kate # advanced text editor
    libsForQt5.okular # KDE document viewer

    # Video:
    ffmpeg # a complete, cross-platform solution to record, convert and stream audio and video
    ffmpegthumbnailer # a lightweight video thumbnailer
    mpv # general-purpose media player, fork of MPlayer and mplayer2

    # Web:
    ddgr # search DuckDuckGo from the terminal
    firefox-devedition-bin # Mozilla Firefox, free web browser (binary package)
    transmission-qt # a fast, easy and free BitTorrent client
  ];
}
