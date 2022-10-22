{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # The configuration of the Nix Packages collection.
  # (For details, see the Nixpkgs documentation.)
  # It allows you to set package configuration options.
  # Ignored when `nixpkgs.pkgs` is set.
  nixpkgs.config = {
    allowUnfree = true;
  };


  nix = {
    #package = pkgs.nixFlakes;

    # Rebuild smoothly:
    daemonCPUSchedPolicy = "idle"; # default "other"
    daemonIOSchedPriority = 2; # default 0, values in the range 0 (high) to 7 (low)
  };


  # Additional text appended to `nix.conf`:
  #nix.extraOptions = ''
  #  experimental-features = nix-command flakes
  #'';
}
