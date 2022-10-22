{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # List services that you want to enable:
  services = {
    # Whether to enable GNOME Keyring daemon,
    # a service designed to take care of the user's security credentials,
    # such as user names and passwords.
    #gnome.gnome-keyring.enable = true;

    # Whether to enable Greenclip daemon.
    services.greenclip.enable = true;
    #services.greenclip.package = pkgs.haskellPackages.greenclip;

    # Whether to enable GVfs, a userspace virtual filesystem.
    gvfs.enable = true;
    #gvfs.package = pkgs.gnome.gvfs;

    # Whether to enable Udisks,
    # a DBus service that allows applications to query and manipulate storage devices.
    udisks2.enable = true;
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    # Enable dconf, a low-level configuration system and settings management tool:
    dconf.enable = true;

    
    # Enables GnuPG agent with socket-activation for every user session.
    gnupg.agent = {
      enable = true;

      # Enable SSH agent support in GnuPG agent.
      # Also sets `SSH_AUTH_SOCK` environment variable correctly.
      # This will disable socket-activation
      # and thus always start a GnuPG agent per user session.
      #enableSSHSupport = true;
      # Which pinentry interface to use.
      pinentryFlavor = "qt"; # `null` or one of "curses", "tty", "gtk2", "emacs", "gnome3", "qt"
    };
  };
}
