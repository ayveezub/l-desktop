{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  boot = {
    # Names of supported filesystem types:
    supportedFilesystems = [ "ntfs" ];

    # Whether to delete all files in `/tmp` during boot.
    cleanTmpDir = true;
    # Whether to mount a tmpfs on `/tmp` during boot.
    tmpOnTmpfs = true;
    # Size of tmpfs in percentage.
    # Percentage is defined by systemd.
    tmpOnTmpfsSize = "50%";
  };


  boot.loader = {
    # Where the EFI System Partition is mounted.
    efi.efiSysMountPoint = "/boot/efi"; # default "/boot"

    # Whether the installation process is allowed to modify EFI boot variables.
    efi.canTouchEfiVariables = true;

    # Timeout (in seconds) until loader boots the default menu item.
    # Use `null` if the loader menu should be displayed indefinitely.
    timeout = 5;
  };

  # Enable the systemd-boot (formerly gummiboot) EFI boot manager:
  boot.loader.systemd-boot = {
    enable = true;

    # Maximum number of latest generations in the boot menu.
    # Useful to prevent boot partition running out of disk space.
    # `null` means no limit i.e. all generations that were not garbage collected yet.
    configurationLimit = 11;
    # Make Memtest86+ (or MemTest86 if EFI support is enabled),
    # available from the systemd-boot menu:
    memtest86.enable = true;
  };
}
