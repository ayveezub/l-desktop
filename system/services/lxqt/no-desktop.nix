{ config, lib, ... }:

{
  environment.etc."xdg/autostart/lxqt-desktop.desktop" = {
    enable = true;
    mode = "+555";
    text = ''
      [Desktop Entry]
      Type=Application
      Exec=pcmanfm-qt -d
      TryExec=pcmanfm-qt
      OnlyShowIn=LXQt;
      X-LXQt-Module=true

      #TRANSLATIONS_DIR=translations
    '';
  };
}
