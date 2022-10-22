{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  environment.systemPackages = with pkgs; [
    unstable.fheroes2 # free implementation of Heroes of Might and Magic II game engine
    #unstable.openmw # an unofficial open source engine reimplementation of the game Morrowind
  ];
}
