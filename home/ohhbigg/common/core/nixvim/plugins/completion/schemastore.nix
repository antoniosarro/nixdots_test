{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.completion.schemastore.enable = lib.mkEnableOption "enables schemastore module";
  };

  config = lib.mkIf config.nixvim-config.completion.schemastore.enable {
    programs.nixvim.plugins = {
      schemastore = {
        enable = true;
        yaml.enable = true;
        json.enable = false;
      };
    };
  };
}
