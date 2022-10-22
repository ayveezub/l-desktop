{ config, lib, ... }:

{
  imports = [
    # Extra Packages:
    ./extra-packages.nix
    ./extra-packages/games.nix
    ./extra-packages/steam.nix


    # Include the results of the hardware scan:
    ./hardware-configuration.nix

    # Hardware:
    ./hardware/audio/pipewire.nix
    ./hardware/boot/systemd-boot.nix
    ./hardware/cpu/intel-x86.nix
    ./hardware/display/high-dpi.nix
    ./hardware/kernel/default.nix
    ./hardware/keyboard/pc104_en-ru.nix
    ./hardware/mouse-n-touchpad/libinput.nix
    ./hardware/power-management/laptop.nix
    ./hardware/printing/cups.nix
    ./hardware/video/intel-intel.nix


    # Personalize your machine:
    ./personalization/console/default.nix
    ./personalization/fonts/default.nix
    ./personalization/greeters/breeze.nix
    ./personalization/locales/en_en-ru.nix
    ./personalization/themes/breeze.nix
    ./personalization/timezone/europe-moscow_55.75N-37.61E.nix
    ./personalization/wallpapers/random-bing.nix


    # System:
    ./system.nix


    # Users:
    ./users/aleksey.nix
    ./users/ksevelyar.nix
  ];


  # Define your machine's hostname:
  networking.hostName = "a11-tpad";


  # The swap devices and swap files.
  # These must have been initialised using `mkswap`.
  # Each element should be an attribute set specifying
  # either the path of the swap device or file (`device`)
  # or the label of the swap device (`label`, see `mkswap -L`).
  # Using a label is recommended.
  swapDevices = [ { device = "/var/swapfile"; size = 2048; } ];


  # Automatically log in as `autoLogin.user`:
  #services.xserver.displayManager.autoLogin.enable = true;
  #services.xserver.displayManager.autoLogin.user = "aleksey";


  # If set to `true`, you are free to add new users and groups to the system
  # with the ordinary `useradd` and `groupadd` commands.
  # On system activation, the existing contents of the `/etc/passwd` and `/etc/group` files
  # will be merged with the contents generated from the `users.users` and `users.groups` options.
  # The initial password for a user will be set according to `users.users`,
  # but existing passwords will not be changed.
  #
  # If set to `false`, the contents of the user and group files
  # will simply be replaced on system activation.
  # This also holds for the user passwords; all changed passwords
  # will be reset according to the `users.users` configuration on activation.
  users.mutableUsers = lib.mkForce true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
