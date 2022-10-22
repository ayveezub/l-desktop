{ config, lib, ... }:

{
  # Whether to enable automatic HiDPI mode.
  services.xserver.displayManager.sddm.enableHidpi = false;

  
  # Extra settings merged in and overwritting defaults in `sddm.conf`.
  services.xserver.displayManager.sddm.settings = {
    Theme = {
      Current = "breeze";
      CursorTheme = "breeze_cursors";
    };
  };
}
