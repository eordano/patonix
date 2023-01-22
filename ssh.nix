{ config, inputs, ... }:
{
  services.openssh = {
    enable = true;
  };
  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPMnuy4yw2AE2BzDuSA85IQUCx4WNgVJo5rEv4nPbhp5"
    ];
  };
}
