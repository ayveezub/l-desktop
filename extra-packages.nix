{ config, pkgs, lib, ... }:

let
  # Install a package from unstable while remaining on the stable channel:
  #
  # `sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable`
  # `sudo nix-channel --update`
  #
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # The set of packages that appear in `/run/current-system/sw`.
  # These packages are automatically available to all users,
  # and are automatically updated every time you rebuild the system configuration.
  # (The latter is the main difference with installing them in the default profile,
  # `/nix/var/nix/profiles/default`.
  environment.systemPackages = with pkgs; [
    unstable.nodejs # event-driven I/O framework for the V8 JavaScript engine
    wineWowPackages.stagingFull # wine with staging patches

    # Audio:
    #unstable.spotify # play music from the Spotify music service

    # Dev:
    speedcrunch # a fast power user calculator
    #unstable.vscodium-fhs # wrapped variant of vscodium which launches in a FHS compatible environment

    # DIY:
    platformio # an open source ecosystem for IoT development
    prusa-slicer # G-code generator for 3D printer

    # Web:
    chromium # an open source web browser from Google
    unstable.libsForQt5.plasmatube # Youtube player powered by an invidious server
    rssguard # simple RSS/Atom feed reader with online synchronization
    unstable.tor-browser-bundle-bin # Tor Browser Bundle built by torproject.org
    #unstable.youtube-dl # cli tool to download videos from YouTube.com and other sites
    unstable.yt-dlp # youtube-dl fork
  ];
}
