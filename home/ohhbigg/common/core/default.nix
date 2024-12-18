{
  config,
  lib,
  pkgs,
  hostSpec,
  ...
}: let
  platform = "nixos";
in {
  imports = lib.flatten [
    (map lib.custom.relativeToRoot [
      "modules/common/host-spec.nix"
      "modules/home-manager"
    ])
    ./${platform}.nix
    ./nixvim
    ./shell
    ./fonts.nix
    ./git.nix
    ./kitty.nix
    ./xdg.nix
  ];

  inherit hostSpec;

  home = {
    username = lib.mkDefault config.hostSpec.username;
    homeDirectory = lib.mkDefault config.hostSpec.home;
    stateVersion = lib.mkDefault "24.11";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    preferXdgDirectories = true;
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
