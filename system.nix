{ config, pkgs, lib, ... }:

let
  # Install a package from unstable while remaining on the stable channel:
  #
  # `sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable`
  # `sudo nix-channel --update`
  #
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  imports = [
    # Dependencies:
    ./system/dependencies.nix

    # Networking:
    ./system/networking.nix
    ./system/networking/networkmanager.nix
    ./system/networking/openvpn.nix

    # Configuration for Nix:
    ./system/nix.nix

    # Packages:
    ./system/packages.nix
    ./system/packages/nano.nix
    ./system/packages/nnn.nix
    ./system/packages/utilities.nix

    # Scripts:
    ./system/scripts.nix

    # Security:
    ./system/security.nix

    # Services:
    ./system/services.nix
    ./system/services/picom.nix
    ./system/services/xserver.nix
    ./system/services/lxqt/lxqt-session.nix
    ./system/services/lxqt/no-desktop.nix

    # Shell:
    ./system/shell.nix
    ./system/shell/fish.nix

    # XDG MIME Applications:
    ./system/xdg.mime.nix
  ];


  # Enable the LXQt Desktop Environment:
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;

  # Graphical session to pre-select in the session chooser
  # (only effective for GDM, LightDM and SDDM).
  # On GDM, LightDM and SDDM, it will also be used as a session for auto-login.
  services.xserver.displayManager.defaultSession = "lxqt";

  # Enable xdg desktop integration:
  xdg.portal.enable = true;
  xdg.portal.lxqt.enable = true;


  # A set of environment variables used in the global environment.
  # These variables will be set on shell initialisation (e.g. in `/etc/profile`).
  # The value of each variable can be either a string or a list of strings.
  # The latter is concatenated, interspersed with colon characters.
  environment.variables = {
    BROWSER = "firefox-devedition";
    EDITOR = "nano";
    TERMINAL = "alacritty";
    VISUAL = "nano";
  };


  # Shell commands executed just after the X server has started.
  # This option is only effective for display managers for which this feature is supported;
  # currently these are LightDM, GDM and SDDM.
  services.xserver.displayManager.setupCommands = ''
    #disable screen blanking
    xset s off
  '';


  # Which LXQt packages to exclude from the default environment.
  environment.lxqt.excludePackages = with pkgs; [
    lxqt.compton-conf # GUI configuration tool for compton (deprecated)
    lxqt.lximage-qt # the image viewer and screenshot tool for lxqt
    lxqt.lxqt-globalkeys # LXQt service for global keyboard shortcuts registration
    lxqt.lxqt-runner # tool used to launch programs quickly by typing their names
    lxqt.obconf-qt # the Qt port of obconf, the Openbox configuration tool
    lxqt.qterminal # a lightweight Qt-based terminal emulator
    xscreensaver # a set of screensavers
  ];
}
