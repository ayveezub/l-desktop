{ config, lib, ... }:

{
  # Enable libinput:
  services.xserver.libinput = {
    enable = true;

    # Disable touchpad and mouse accelerations:
    #mouse.accelProfile = "flat";
    #touchpad.accelProfile = "flat";
  };
}
