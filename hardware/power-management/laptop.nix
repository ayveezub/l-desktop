{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # Whether to enable power management.
  # This includes support for suspend-to-RAM and powersave features on laptops.
  powerManagement.enable = true;
  # Whether to enable Upower,
  # a DBus service that provides power management support to applications:
  services.upower.enable = config.powerManagement.enable;


  environment.systemPackages = with pkgs; [
    acpi # show battery status and other ACPI information
    powertop # analyze power consumption on Intel-based laptops
  ];


  # Enable the TLP power management daemon:
  services.tlp.enable = true;

  # Options passed to TLP.
  # See `https://linrunner.de/tlp` for all supported options.
  services.tlp.settings = {
    USB_AUTOSUSPEND = 0; # disable too aggressive power-management autosuspend for USB
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  };
}
