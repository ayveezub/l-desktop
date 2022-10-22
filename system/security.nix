{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # Enable polkit:
  security.polkit.enable = true;

  # Enable the RealtimeKit system service,
  # which hands out realtime scheduling priority to user processes on demand.
  # For example, the PulseAudio server uses this to acquire realtime priority.
  security.rtkit.enable = true;


  environment.systemPackages = with pkgs; [
    keepassxc # offline password manager with many features
    secretscanner # tool to find secrets and passwords in container images and file systems
  ];
}
