{ pkgs, ... }: {
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDerZOezNrs95Sm5sizY7LA/9axm8HoOEnorNlADw0Rm root@host"
  ];

  users.users.user = {
    uid = 1000;
    shell = pkgs.fish;
    isNormalUser = true;
    linger = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFPe92LGBClSeLpArZLDjFGzg5LK8G6pA3TQ4RaNszRa root@wsl"
    ];
  };
}
