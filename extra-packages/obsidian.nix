{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  nixpkgs.config.permittedInsecurePackages = [ "electron-13.6.9" ];

  
  environment.systemPackages = with pkgs; [
    obsidian # a powerful knowledge base that works on top of a local folder of plain text Markdown files
  ];
}
