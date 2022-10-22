{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # Enable steam:
  programs.steam.enable = true;

  
  environment.systemPackages = with pkgs; [
    protontricks # a simple wrapper for running Winetricks commands for Proton-enabled games
  ];
}
