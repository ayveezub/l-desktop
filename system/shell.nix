{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # This option defines the default shell assigned to user accounts.
  # This can be either a full system path or a shell package.
  # This must not be a store path,
  # since the path is used outside the store (in particular in `/etc/passwd`).
  users.defaultUserShell = pkgs.fish;


  # An attribute set that maps aliases (the top level attribute names in this option)
  # to command strings or directly to build outputs.
  # The aliases are added to all users' shells.
  # Aliases mapped to `null` are ignored.
  environment.shellAliases = {
    s = "sudo";
  
    sr = "sudo systemctl restart";
    st = "sudo systemctl status";
    ss = "sudo systemctl stop";

    ld-cd = "cd /etc/nixos && exa -abFhlm --group-directories-first --octal-permissions --no-permissions --no-user";
    ld-cds = "cd /etc/nixos/system && exa -abFhlm --group-directories-first --octal-permissions --no-permissions --no-user";
    ld-gc = "sudo nix-collect-garbage -d";
    ld-ih = "ld-init-home";
    ld-is = "nix path-info -rSh /run/current-system | sort -k2h ";
    ld-chu = "sudo nix-channel --update";
    ld-rbb = "sudo nixos-rebuild boot";
    ld-rbs = "sudo nixos-rebuild switch";

    ld-x = "sudo systemctl restart display-manager";


    # FS:
    l = "exa -abFhlm --group-directories-first --no-user";
    ls = "exa --group-directories-first";
    n = "nnn";
    r = "rsync -av --checksum --info=progress2 --stats --human-readable";
    tree = "exa --tree";


    # Git:
    g = "git";
    gamend = "git add . && git commit --amend --no-edit";
    gc = "git commit --message";
    gca = "git commit --all --message";
    gco = "git checkout";
    gd = "git diff";
    gdc = "git diff --cached";
    gfr = "git pull --rebase";
    gl = "git lg";
    gp = "git push";
    gs = "git status --short";
    gsa = "git stash apply";
    gsl = "git stash list --pretty=format:'%Cblue%gd%C(yellow): %C(brightwhite)%s'";
    gso = "git log -p --all --source -S "; # search string in all branches, gso <string>
    gsp = "git stash pop";
    gst = "git stash";
    gsw = "git switch";
    tig = "tig status";

    grho-main = "git switch main && git fetch && git reset --hard origin/main";
    grho-master = "git switch master && git fetch && git reset --hard origin/master";


    # Info:
    du = "dust";
    h = "tldr"; # try tldr instead of man
    hi = "ld-machine-info";
    ps = "procs";
  };
}
