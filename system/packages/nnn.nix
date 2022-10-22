{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  environment.systemPackages = with pkgs; [
    nnn # small ncurses-based file browser forked from noice
  ];


  # One way to manage bookmarks:
  #
  # Set environment variable `NNN_BMS`
  # as a string of `key_char:location` pairs separated by semicolons `( ; )`
  # The bookmarks are listed in the help and config screen (key `?`).
  # The select bookmark key `b`
  # lists all the bookmark keys set in `NNN_BMS` in the bookmarks prompt.
  environment.variables.NNN_BMS = "a:$HOME/Art;d:$HOME/Dev;D:$HOME/Downloads;l:$HOME/Lit;M:$HOME/Music;v:$HOME/Vaults;V:$HOME/Videos";
}
