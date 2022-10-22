{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # Bigger tty fonts:
  console.font = lib.mkForce "${pkgs.terminus_font}/share/consolefonts/ter-v32n.psf.gz";

  fonts.fontconfig = {
    antialias = lib.mkForce false;
    hinting.enable = lib.mkForce false;
    subpixel.lcdfilter = lib.mkForce "none";
  };

  # Enable SDDM automatic HiDPI mode:
  services.xserver.displayManager.sddm.enableHidpi = lib.mkForce true;

  # Force global DPI resolution to use for X server.
  # It's recommended to use this only when DPI is detected incorrectly;
  # also consider using Monitor section in configuration file instead.
  #services.xserver.dpi = lib.mkForce 196;
  

  environment.systemPackages = with pkgs; [
    brightnessctl # this program allows you read and control device brightness
  ];
}
