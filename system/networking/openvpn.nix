{ config, lib, ... }:

{
  # Each attribute of this option defines a systemd service that runs an OpenVPN instance.
  # These can be OpenVPN servers or clients.
  # The name of each systemd service is `openvpn-name.service`,
  # where <name> is the corresponding attribute name.
  services.openvpn.servers = {
    de-shark = {
      config = '' config /etc/nixos/system/networking/openvpn_surfshark/de-ber.prod.surfshark.com_udp.ovpn '';

      autoStart = lib.mkDefault false;
      updateResolvConf = true;
    };
    fr-shark = {
      config = '' config /etc/nixos/system/networking/openvpn_surfshark/fr-par.prod.surfshark.com_udp.ovpn '';

      autoStart = lib.mkDefault false;
      updateResolvConf = true;
    };
    uk-shark = {
      config = '' config /etc/nixos/system/networking/openvpn_surfshark/uk-lon.prod.surfshark.com_udp.ovpn '';
      
      autoStart = lib.mkDefault false;
      updateResolvConf = true;
    };
  };
}
