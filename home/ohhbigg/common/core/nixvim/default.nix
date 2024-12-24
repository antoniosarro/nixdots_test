{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./autocommands.nix
    ./keymaps.nix
    ./plugins
  ];
}
