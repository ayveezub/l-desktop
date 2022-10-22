{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # Disable the PulseAudio sound server:
  hardware.pulseaudio.enable = lib.mkForce false;

  
  # Enable pipewire:
  services.pipewire = {
    enable = true;

    # Enable ALSA support:
    alsa.enable = true;
    # Enable 32-bit ALSA support on 64-bit systems:
    alsa.support32Bit = true;

    # Enable PulseAudio server emulation:
    pulse.enable = true;
  };


  environment.systemPackages = with pkgs; [
    alsa-utils # the Advanced Linux Sound Architecture utils
    pamixer # PulseAudio command line mixer
    lxqt.pavucontrol-qt # a Pulseaudio mixer in Qt (port of pavucontrol)
  ];
}
