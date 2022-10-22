{ config, pkgs, lib, ... }:

let
  ld-set-background = pkgs.writeShellScriptBin "ld-set-background" ''
    # Shebang line prepended by `pkgs.writeShellScriptBin`.

    #set random bing background
    if [ -x "$(command -v feh)" ]; then
      feh --randomize --bg-fill --no-fehbg /etc/nixos/assets/wallpapers/bing/*
    fi
  '';

in {
  environment.systemPackages = [
    ld-set-background
  ];
}
