{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in {
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  networking.useDHCP = false;


  # This is a simple stateful firewall
  # that blocks connection attempts to unauthorised TCP or UDP ports on this machine.
  # It does not affect packet forwarding.
  networking.firewall = {
    enable = true;

    # List of TCP ports on which incoming connections are accepted:
    allowedTCPPorts = [
      3000 4000 4040 8080 # Dev
      1234 # Dev
      51413 # Transmission
    ];
    # List of open UDP ports:
    allowedUDPPorts = [
      51413 # Transmission
    ];
  };


  # Enable the OpenSSH secure shell daemon, which allows secure remote logins:
  services.openssh = {
    enable = true;

    # Specifies on which ports the SSH daemon listens.
    ports = [ 9911 ];
    # Whether the root user can login using ssh.
    # (One of "yes", "without-password", "prohibit-password", "forced-commands-only", "no").
    permitRootLogin = "no";
  };


  # Add mtr to the global environment and configure a setcap wrapper for it:
  programs.mtr = {
    enable = true;
  };


  environment.systemPackages = with pkgs; [
    curl # a command line tool for transferring files with URL syntax
    curlie # frontend to curl that adds the ease of use of httpie, without compromising on features and performance
    ffsend # a fully featured Firefox Send client
    inetutils # collection of common network programs
    nbtscanner # a tiny tool to scan a set of IP's for NetBIOS name information written in Rust
    #nm-tray # simple Network Manager frontend written in Qt
    nmap # free and open source utility for network discovery and security auditing
    sipcalc # advanced console ip subnet calculator
    wget # tool for retrieving files using HTTP, HTTPS, and FTP
    wget2 # successor of GNU Wget, a file and recursive website downloader
  ];
}
