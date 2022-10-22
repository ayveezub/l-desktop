{ config, lib, ... }:

{
  environment.etc."xdg/lxqt/lxqt.conf" = {
    enable = true;
    text = ''
      [General]
      theme=breeze
      icon_theme=breeze
      single_click_activate=false
      tool_button_style=ToolButtonTextBesideIcon

      [Qt]
      font="Sans,16,-1,5,50,0,0,0,0,0"
      doubleClickInterval=400
      style=Breeze
      wheelScrollLines=3
    '';
  };


  environment.etc."xdg/lxqt/session.conf" = {
    enable = true;
    text = ''
      [General]
      window_manager=/run/current-system/sw/bin/leftwm
      leave_confirmation=true

      [Environment]
      GTK_CSD=0
      GTK_OVERLAY_SCROLLING=0

      [Mouse]
      cursor_size=18
      cursor_theme=breeze_cursors
      acc_factor=20
      acc_threshold=10
      left_handed=false

      [Keyboard]
      delay=500
      interval=30
      beep=false

      [Font]
      antialias=true
      hinting=true
      dpi=96
    '';
  };
}
