{ config, lib, ... }:

{
  # Enable Picom as the X.org composite manager:
  services.picom = {
    enable = true;

    # Backend to use: `glx`, `xrender` or `xr_glx_hybrid`.
    backend = "glx"; # default "xrender"
    # Whether to use the unstable new reimplementation of the backends.
    #experimentalBackends = true;

    # Fade windows in and out.
    fade = true;
    # Time between fade animation step (in ms).
    #fadeDelta = 5; default 10

    # Draw window shadows.
    shadow = false;

    # Enable vertical synchronization. Chooses the best method
    # (`drm`, `opengl`, `opengl-oml`, `opengl-swc`, `opengl-mswc`) automatically.
    # The bool value should be used, the others are just for backwards compatibility.
    vSync = true;
  };


  # Rules for specific window types.
  #services.picom.wintypes = {
  #  dropdown_menu = { opacity = config.services.picom.menuOpacity; };
  #  popup_menu = { opacity = config.services.picom.menuOpacity; };
  #};


  # Picom settings.
  # Use this option to configure Picom settings
  # not exposed in a NixOS option or to bypass one.
  # For the available options see the CONFIGURATION FILES section at `picom(1)`.
  services.picom.settings = {
    # Sets the radius of rounded window corners.
    # When > 0, the compositor will round the corners of windows.
    corner-radius = 6; # default 0
    # Exclude conditions for rounded corners.
    #rounded-corners-exclude = [];

    # Specify a list of conditions of windows
    # that should always be considered focused.
    focus-exclude = [ "class_g = 'Conky'" "class_g = 'Rofi'" ];

    # GLX backend: Avoid using stencil buffer.
    # Might cause issues when rendering transparent content.
    # My tests show a 15% performance boost.
    #glx-no-stencil = true;

    # Dim inactive windows. (0.0 - 1.0)
    inactive-dim = 0.2; # default 0

    # Mark windows that have no WM frame as active.
    #mark-ovredir-focused = true;

    # Unredirect all windows if a full-screen opaque window is detected,
    # to maximize performance for full-screen windows.
    unredir-if-possible = true;
    # Delay before unredirecting the window, in milliseconds.
    unredir-if-possible-delay = 500; # default 0
    # Conditions of windows
    # that shouldn't be considered full-screen for unredirecting screen.
    unredir-if-possible-exclude = [ "class_g = 'firefox-aurora'" ];
  };
}
