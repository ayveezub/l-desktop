{ config, lib, ... }:

{
  # Whether to enable power management.
  # This includes support for suspend-to-RAM and powersave features on laptops.
  powerManagement.enable = true;
  # Whether to enable Upower,
  # a DBus service that provides power management support to applications:
  services.upower.enable = config.powerManagement.enable;
}
