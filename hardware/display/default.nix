{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  environment.systemPackages = with pkgs; [
    brightnessctl # this program allows you read and control device brightness
  ];
}
