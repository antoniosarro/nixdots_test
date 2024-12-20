{pkgs, ...}: {
  imports = [
    ./hyprland
    ./waybar.nix
    ./rofi.nix
  ];
}
