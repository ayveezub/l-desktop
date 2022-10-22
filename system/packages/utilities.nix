{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  environment.systemPackages = with pkgs; [
    cargo # downloads your Rust project's dependencies and builds your project
    coreutils # the basic file, shell and text manipulation utilities of the GNU operating system
    efibootmgr # a Linux user-space application to modify the Intel Extensible Firmware Interface (EFI) Boot Manager
    gcc # GNU Compiler Collection, version 10.3.0 (wrapper script)
    pciutils # a collection of programs for inspecting and manipulating configuration of PCI devices
    psmisc # a set of small useful utilities that use the proc filesystem (such as fuser, killall and pstree)
    rustc # Rust Compiler

    # Archiving:
    atool # archive command line helper
    gnutar # GNU implementation of the `tar` archiver
    gzip # GNU zip compression program
    p7zip # a new p7zip fork with additional codecs and improvements
    pigz # a parallel implementation of gzip for multi-core machines
    unar # an archive unpacker program
    unzip # an extraction utility for archives compressed in `.zip` format

    # FS:
    ddrescue # GNU ddrescue, a data recovery tool
    ddrescueview # a tool to graphically examine ddrescue mapfiles
    dosfstools # utilities for creating and checking FAT and VFAT file systems
    exa # replacement for 'ls' written in Rust
    fd # a simple, fast and user-friendly alternative to find
    fzf # a command-line fuzzy finder written in Go
    gparted # graphical disk partitioning tool
    gptfdisk # set of text-mode partitioning tools for Globally Unique Identifier (GUID) Partition Table (GPT) disks
    less # a more advanced file pager than ‘more’
    lnav # The Logfile Navigator
    mc # File Manager and User Shell for the GNU Project
    mtools # utilities to access MS-DOS disks
    parted # create, destroy, resize, check, and copy partitions
    pmount # mount removable devices as normal user
    ripgrep # a utility that combines the usability of The Silver Searcher with the raw speed of grep
    rsync # a fast incremental file transfer utility
    sd # intuitive find & replace CLI (sed alternative)
    skim # command-line fuzzy finder written in Rust
    testdisk-qt # data recovery utilities
    woeusb # create bootable USB disks from Windows ISO images
    zoxide # a fast cd command that learns your habits

    # Image:
    imagemagick # a software suite to create, edit, compose, or convert bitmap images

    # Info:
    bottom # a cross-platform graphical process/system monitor with a customizable interface written in Rust
    du-dust # du + rust = dust (like du, but more intuitive)
    glxinfo # test utilities for OpenGL
    gsmartcontrol # hard disk drive health inspection tool
    hddtemp # tool for displaying hard disk temperature
    hwinfo # hardware detection tool from openSUSE
    hyperfine # command-line benchmarking tool
    i2c-tools # set of I2C tools for Linux
    inxi # a full featured CLI system information tool
    iotop # a tool to find out the processes doing the most IO
    iperf2 # tool to measure IP bandwidth using UDP or TCP
    lm_sensors # tools for reading hardware sensors
    lshw # provide detailed information on the hardware configuration of the machine
    neofetch # a fast, highly customizable system info script
    procs # a modern replacement for ps written in Rust
    smartmontools # tools for monitoring the health of hard drives
    tealdeer # a very fast implementation of tldr in Rust

    # Text:
    djvulibre # the big set of CLI tools to make/modify/optimize/show/export DJVU files
    dos2unix # convert text files with DOS or Mac line breaks to Unix line breaks and vice versa
    html2text # convert HTML to plain text
    jq # a lightweight and flexible command-line JSON processor
  ];
}
