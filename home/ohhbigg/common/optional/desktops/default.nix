{pkgs, ...}: {
  imports = [
    ./hyprland
    ./services/dunst.nix
    ./waybar.nix
    ./rofi.nix
    ./gtk.nix
    ./qt.nix
  ];
}
