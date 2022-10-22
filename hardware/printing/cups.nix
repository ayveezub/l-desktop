{ config, lib, ... }:

{
  # Whether to enable printing support through the CUPS daemon.
  services.printing = {
    enable = true;
  };
}
