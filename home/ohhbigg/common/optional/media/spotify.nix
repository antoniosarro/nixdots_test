{
  pkgs,
  config,
  lib,
  inputs,
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  removeHashtag = builtins.substring 1;
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["spotify"];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    colorScheme = "custom";
    customColorScheme = {
      accent = removeHashtag config.hostSpec.theme.colors.base0B;
      accent-active = removeHashtag config.hostSpec.theme.colors.base0B;
      accent-inactive = removeHashtag config.hostSpec.theme.colors.base00;
      banner = removeHashtag config.hostSpec.theme.colors.base0B;
      border-active = removeHashtag config.hostSpec.theme.colors.base0B;
      border-inactive = removeHashtag config.hostSpec.theme.colors.base02;
      header = removeHashtag config.hostSpec.theme.colors.base04;
      highlight = removeHashtag config.hostSpec.theme.colors.base04;
      main = removeHashtag config.hostSpec.theme.colors.base00;
      notification = removeHashtag config.hostSpec.theme.colors.base0D;
      notification-error = removeHashtag config.hostSpec.theme.colors.base08;
      subtext = "a6adc8";
      text = removeHashtag config.hostSpec.theme.colors.base05;
    };

    enabledExtensions = with spicePkgs.extensions; [
      playlistIcons
      historyShortcut
      hidePodcasts
      adblock
      fullAppDisplay
      shuffle
    ];
  };
}
