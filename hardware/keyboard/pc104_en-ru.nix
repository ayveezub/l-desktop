{ config, lib, ... }:

{
  # Configure keymap in X11:
  services.xserver = {
    layout = "us,ru";
    xkbModel = "pc104";
    xkbOptions = "grp:caps_toggle,grp_led:caps,shift:both_capslock_cancel,lv3:ralt_switch_multikey,eurosign:5";
    xkbVariant = ",winkeys";
  };
}
