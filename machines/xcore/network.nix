{ lib, ... }:
let
  index = 2;
  mac = "00:00:00:00:00:02";
in {
  networking = {
    hostName = "xcore";
    useDHCP = false;
  };

  systemd.network = {
    enable = true;
    networks."10-eth" = {
      matchConfig.MACAddress = mac;
      address = [
        "192.168.100.${toString index}/32"
        "fec0::${lib.toHexString index}/128"
      ];
      routes = [
        {
          Destination = "192.168.100.0/32";
          GatewayOnLink = true;
        }
        {
          Destination = "0.0.0.0/0";
          Gateway = "192.168.100.0";
          GatewayOnLink = true;
        }
        {
          Destination = "::/0";
          Gateway = "fec0::";
          GatewayOnLink = true;
        }
      ];
    };
  };

  networking.firewall.allowedTCPPortRanges = [
    { from = 52000; to = 52999; }
  ];
  networking.firewall.allowedUDPPortRanges = [
    { from = 52000; to = 52999; }
  ];

  virtualisation.vmVariantWithBootLoader.virtualisation = {
    qemu.networkingOptions = lib.mkForce [
      "-nic tap,script=no,downscript=no,vhost=on,model=virtio-net-pci,ifname=vm${toString index},mac=${mac}"
    ];
  };
}
