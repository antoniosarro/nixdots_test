############################################################################
#
#  Main Desktop
#  NixOS running on Ryzen 5 5600X, Radeon RX 6700 XT, 32GB RAM
#
############################################################################
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = lib.flatten [
    # ============================
    # Hardware
    # ============================
    ./hardware-configuration.nix
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    # ============================
    # Disk Layout
    # ============================
    inputs.disko.nixosModules.disko
    (lib.custom.relativeToRoot "hosts/common/disks/desktop.nix")

    (map lib.custom.relativeToRoot [
      # Required Configs
      "hosts/common/core"
    ])
  ];
}
