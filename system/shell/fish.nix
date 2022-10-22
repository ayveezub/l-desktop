{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # Configure fish as an interactive shell:
  programs.fish = {
    enable = true;
  };

  # Enables the daemon for lorri, a nix-shell replacement for project development.
  # The socket-activated daemon starts on the first request issued by the `lorri` command. 
  services.lorri.enable = true;


  environment.systemPackages = with pkgs; [
    # Once hooked into your shell direnv is looking for
    # an `.envrc` file in your current directory before every prompt.
    # If found it will load the exported environment variables
    # from that bash script into your current environment,
    # and unload them if the `.envrc` is not reachable from the current path anymore.
    # In short, this little tool allows you to have project-specific environment variables.
    direnv # a shell extension that manages your environment
  ];
}
