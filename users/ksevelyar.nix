{ config, lib, ... }:

{
  # Define a user account. Don't forget to set a password with `passwd`.
  users.users.ksevelyar = {
    description = "ksevelyar";
    initialPassword = "ksevelyar";
    uid = 1000;

    isNormalUser = true;
    extraGroups = [ "wheel" # enable `sudo` for the user
      "networkmanager"
      "video" # to enable the use of `brightnessctl`
    ];
  };
}
