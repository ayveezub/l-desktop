{ config, pkgs, lib, ... }:

let
  ld-export-xdg-user-vars = pkgs.writeShellScriptBin "ld-export-xdg-user-vars" ''
    # Shebang line prepended by `pkgs.writeShellScriptBin`.

    if [ -z "$XDG_DATA_HOME" ]; then
      export XDG_DATA_HOME="$HOME/.local/share"
    fi
    if [ -z "$XDG_CONFIG_HOME" ]; then
      export XDG_CONFIG_HOME="$HOME/.config"
    fi
    if [ -z "$XDG_STATE_HOME" ]; then
      export XDG_STATE_HOME="$HOME/.local/state"
    fi
    if [ -z "$XDG_CACHE_HOME" ]; then
      export XDG_CACHE_HOME="$HOME/.cache"
    fi
  '';

  ld-machine-info = pkgs.writeShellScriptBin "ld-machine-info" ''
    # Shebang line prepended by `pkgs.writeShellScriptBin`.

    LOCAL_IP=$(ip -o addr show | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $4}' | cut -d'/' -f 1)
    PUBLIC_IP=$(curl -s ifconfig.me)
    CPU=$(sudo lshw -short | grep -i processor | sed 's/\s\s*/ /g' | cut -d' ' -f3-)
    VIDEO=$(sudo lspci | grep -i --color 'vga\|3d\|2d' | cut -d' ' -f2-)
    
    echo -e "local: $LOCAL_IP, public: $PUBLIC_IP\n"
    echo -e "Processor: $CPU"
    echo -e "Video: $VIDEO\n"
    
    echo -e "\n"
    lsblk -f
    
    echo -e "\n"
    lsmod | rg kvm
  '';

  ld-init-home = pkgs.writeShellScriptBin "ld-init-home" ''
    # Shebang line prepended by `pkgs.writeShellScriptBin`.

    R_OPTIONS="-ahv --checksum --info=progress2 --stats"
    R_SOURCE="/etc/nixos/skel"
    R_DESTINATION="$HOME"

    /run/current-system/sw/bin/rsync "$R_OPTIONS" "$R_SOURCE/" "$R_DESTINATION"

    echo -e "lDesktop home directory successfully initialized\n"
  '';

in {
  environment.systemPackages = [
    ld-export-xdg-user-vars
    ld-machine-info
    ld-init-home
  ];
}
