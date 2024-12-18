{
  config,
  pkgs,
  lib,
  ...
}: {
  config = {
    services.greetd = {
      enable = true;
      restart = true;

      settings = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --asterisks --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        user = "ohhbigg";
      };
    };
  };
}
