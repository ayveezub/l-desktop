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
  services.xserver.videoDrivers = [ "intel" ];

  # Additional packages to add to OpenGL drivers.
  # This can be used to add OpenCL drivers, VA-API/VDPAU drivers etc.
  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel # VA-API user mode driver for Intel GEN Graphics family
    vaapiVdpau # VDPAU driver for the VAAPI library
    libvdpau-va-gl # VDPAU driver with OpenGL/VAAPI backend
    intel-media-driver # Intel Media Driver for VAAPI — Broadwell+ iGPUs
  ];

  # On 64-bit systems, whether to support Direct Rendering for 32-bit applications (such as Wine).
  # This is currently only supported for the `nvidia` as well as `Mesa`.
  hardware.opengl.driSupport32Bit = true;


  #environment.systemPackages = with pkgs; [];


  services.xserver = {
    # Additional contents (sections) included in the X server configuration file:
    extraConfig = ''
      Section "Extensions"
        Option    "Composite" "Enable"
      EndSection
    '';
  };
}
