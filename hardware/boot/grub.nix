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
    # Whether the installation process is allowed to modify EFI boot variables.
    efi.canTouchEfiVariables = false;

    # Timeout (in seconds) until loader boots the default menu item.
    # Use `null` if the loader menu should be displayed indefinitely.
    timeout = 5;
  };

  # Enable the GNU GRUB boot loader:
  boot.loader.grub = {
    enable = true;
    version = 2;

    # Define on which hard drive you want to install Grub:
    device = "nodev"; # or `nodev` for efi only

    # Whether GRUB should be built with EFI support.
    efiSupport = true;
    # Whether to invoke `grub-install` with `--removable`.
    #
    # If you turn this feature on, GRUB will install itself in a special location 
    # within `efiSysMountPoint` (namely `EFI/boot/boot$arch.efi`)
    # which the firmwares are hardcoded to try first, regardless of NVRAM EFI variables.
    #
    # Turn this on if:
    # - You are installing NixOS and want it to boot in UEFI mode,
    # but you are currently booted in legacy mode.
    # - You want to make a drive that will boot regardless of the NVRAM state of the computer
    # (like a USB "removable" drive).
    # - You simply dislike the idea of depending on NVRAM state to make your drive bootable.
    efiInstallAsRemovable = true;

    # Background color to be used for GRUB to fill the areas the image isn't filling:
    backgroundColor = "#2980b9";
    # Maximum of configurations in boot menu.
    # (GRUB has problems when there are too many entries.)
    configurationLimit = 11;
    # Index of the default menu item to be booted.
    # (Can also be set to "saved",
    # which will make GRUB select the menu item that was used at the last boot.)
    default = "0";
    # Make Memtest86+ (or MemTest86 if EFI support is enabled),
    # available from the GRUB boot menu:
    memtest86.enable = true;
    # If set to true, append entries for other OSs detected by os-prober.
    #useOSProber = true;
  };
}
