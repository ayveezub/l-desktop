{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # Enable a basic set of fonts
  # providing several font styles and families and reasonable coverage of Unicode:
  fonts.enableDefaultFonts = true;
  # Whether to create a directory
  # with links to all fonts in `/run/current-system/sw/share/X11/fonts`.
  fonts.fontDir.enable = true;


  # If enabled, a Fontconfig configuration file will be built
  # pointing to a set of default fonts.
  # If you don't care about running X11 applications
  # or any other program that uses Fontconfig,
  # you can turn this option off and prevent a dependency on all those fonts.
  fonts.fontconfig = {
    enable = true;

    # Enable font antialiasing.
    # At high resolution (> 200 DPI),
    # antialiasing has no visible effect;
    # users of such displays may want to disable this option.
    antialias = true;

    # Generate system fonts cache for 32-bit applications.
    cache32Bit = true;

    # Enable font hinting.
    # Hinting aligns glyphs to pixel boundaries
    # to improve rendering sharpness at low resolution.
    # At high resolution (> 200 dpi) hinting will do nothing (at best);
    # users of such displays may want to disable this option.
    hinting.enable = true;
    
    # FreeType LCD filter.
    # At high resolution (> 200 DPI), LCD filtering has no visible effect;
    # users of such displays may want to select `none`.
    subpixel.lcdfilter = "default"; # one of "none", "default", "light", "legacy"


    # System-wide default font(s).
    # Multiple fonts may be listed in case multiple languages must be supported.
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ "Source Code Pro" ];
      sansSerif = [ "Roboto" ];
      serif = [ "Roboto Slab" ];
    };
  };


  # List of primary font paths:
  fonts.fonts = with pkgs; [
    corefonts # nonfree Microsoft's TrueType core fonts for the Web
    noto-fonts-emoji # Color and Black-and-White emoji fonts
    roboto # the Roboto family of fonts
    roboto-mono # Google Roboto Mono fonts
    roboto-slab # Roboto Slab Typeface by Google

    siji # an iconic bitmap font based on Stlarch with additional glyphs
    source-sans-pro # Sans Serif font family for user interface environments
    terminus_font # a clean fixed width font

    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/data/fonts/nerdfonts/shas.nix
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];
}
