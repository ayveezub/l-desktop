{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # The names of the video drivers the configuration supports.
  # They will be tried in order until one that supports your card is found.
  # Don't combine those with "incompatible" OpenGL implementations,
  # e.g. free ones (mesa-based) with proprietary ones.
  # For unfree "nvidia*",
  # the supported GPU lists are on `https://www.nvidia.com/object/unix.html`
  services.xserver.videoDrivers = [ "nvidia" ];
  # The NVIDIA X11 derivation to use.
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

  # On 64-bit systems, whether to support Direct Rendering for 32-bit applications (such as Wine).
  # This is currently only supported for the `nvidia` as well as `Mesa`.
  hardware.opengl.driSupport32Bit = true;


  environment.systemPackages = with pkgs; [
    nvtop # a (h)top like task monitor for NVIDIA GPUs
  ];


  services.xserver = {
    # Contents of the first Device section of the X server configuration file:
    deviceSection = ''
      Option    "NoLogo" "1"
    '';

    # Contents of the first Screen section of the X server configuration file:
    screenSection = ''
      Option    "TripleBuffer" "1"
    '';

    # Additional contents (sections) included in the X server configuration file:
    extraConfig = ''
      Section "Extensions"
        Option    "Composite" "Enable"
      EndSection
    '';
  };
}
