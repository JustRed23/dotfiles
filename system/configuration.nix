{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./base.nix
      ./gpu.nix
      ./networking.nix
      ./users.nix
      ./packages.nix
      ./wm.nix
    ];

  system.stateVersion = "25.05";
}

