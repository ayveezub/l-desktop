{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  environment.systemPackages = with pkgs; [
    libsForQt5.breeze-gtk # Breeze widget theme for GTK 2 and 3
    libsForQt5.breeze-qt5 # Breeze visual style for the Plasma Desktop

    libsForQt5.breeze-icons # Breeze icon theme
    hicolor-icon-theme # default fallback theme used by implementations of the icon theme spec

    gtk_engines # theme engines for GTK 2
  ];


  # Extra Qt styles that will be available to the `lxqt.xdg-desktop-portal-lxqt`.
  xdg.portal.lxqt.styles = with pkgs; [
    libsForQt5.breeze-qt5
    libsForQt5.breeze-icons
  ];
}
