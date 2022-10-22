{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # Configure agetty - the default getty in NixOS:
  services.getty = {
    # Welcome line printed by agetty.
    # The default shows current NixOS version label, machine type and tty.
    greetingLine = ''\l'';
    # Help line printed by agetty below the welcome line.
    # Used by the installation CD to give some hints on how to proceed.
    helpLine = ''
      Type `hi` to print system information.
                     
                     
        __/)       __
      -(__(  ---@./ww
          \)     (\  
                  "` 
                     
    '';
  };


  # Enable setting virtual console options as early as possible (in initrd):
  console.earlySetup = true;

  # The font used for the virtual consoles.
  # Leave empty to use whatever the `setfont` program considers the default font.
  # Can be either a font name or a path to a PSF font file.
  console.font = "Lat2-Terminus16";
  # List of additional packages that provide console fonts,
  # keymaps and other resources for virtual consoles use.
  #console.packages = with pkgs; [];

  # The keyboard mapping table for the virtual consoles.
  console.keyMap = "us";


  # The 16 colors palette used by the virtual consoles.
  # Leave empty to use the default colors.
  # Colors must be in hexadecimal format and listed in order from color 0 to color 15.
  console.colors = [
    # everforest color scheme
    "#4a555b" # black (color0)
    "#e68183" # red (color1)
    "#a7c080" # green (color2)
    "#dbbc7f" # yellow (color3)
    "#7fbbb3" # blue (color4)
    "#d699b6" # magenta (color5)
    "#83c092" # cyan (color6)
    "#d8caac" # white (color7)

    "#525c62" # black (color8)
    "#e68183" # red (color9)
    "#a7c080" # green (color10)
    "#dbbc7f" # yellow (color11)
    "#7fbbb3" # blue (color12)
    "#d699b6" # magenta (color13)
    "#83c092" # cyan (color14)
    "#d8caac" # white (color15)
  ];
}
