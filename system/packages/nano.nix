{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  environment.systemPackages = with pkgs; [
    nano # a small, user-friendly console text editor
  ];


  environment.etc."nanorc" = {
    text = ''
      ## Use auto-indentation
      set autoindent
      ## Do case sensitive searches by default
      set casesensitive
      ## Display line numbers to the left of the text area
      #set linenumbers
      ## Enable vim-style lock-files for when editing files
      set locking
      ## Hide the shortcut lists at the bottom of the screen
      #set nohelp
      ## Disable Line Wrapping (nowrap)
      #set nowrap
      ## Use this tab size instead of the default
      set tabsize 2
      ## Convert typed tabs to spaces
      set tabstospaces
      
      
      ##                               ##
      ##  Keyboard bindings/shortcuts  ##
      ##                               ##
      ## Exits from the program (or from the help viewer or file browser)
      bind ^q exit main
      ## Writes the current file to disk without prompting
      bind ^s writeout main
      ## Cuts and stores the current line (or the marked region)
      bind ^x cut main
      ## Copies the current line (or the marked region)
      bind ^c copy main
      ## Pastes the currently stored text into the current buffer at the current cursor position
      bind ^v paste main
      
      ## Undo last action
      bind ^z undo main
      ## Redo last undone action
      bind ^u redo main
      ## Start forward search
      bind ^f whereis main
      ## Goes up one screenful
      bind ^p pageup main
      ## Goes down one screenful
      bind ^n pagedown main
    '';
  };
}
