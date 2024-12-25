{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.git.gitlinker.enable = lib.mkEnableOption "enables gitlinker module";
  };

  config = lib.mkIf config.nixvim-config.git.gitlinker.enable {
    programs.nixvim.plugins = {
      lazygit = {
        enable = true;
        callbacks = {
          "github.com" = "get_github_type_url";
        };
      };
    };
  };
}
