{
  config,
  pkgs,
  ...
}: {
  systemd.user.services.waybar = {
    Unit.StartLimitBurst = 30;
  };
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    settings = {
      # ============================
      # Main Bar
      # ============================
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 5;
        height = 30;
        margin-top = 6;
        margin-left = 10;
        margin-bottom = 0;
        margin-right = 10;
        modules-left = ["custom/launcher" "cpu" "memory"];
        modules-center = [];
        modules-right = [];

        # ============================
        # Module Left
        # ============================
        "custom/launcher" = {
          "format" = " <span color='#ce703b'> </span>";
          "on-click" = "rofi -show drun";
        };
        "cpu" = {
          "interval" = 10;
          "format" = "󰄧 {}%";
          "max-length" = 10;
          "on-click" = "";
        };
        "memory" = {
          "interval" = 30;
          "format" = " {}%";
          "format-alt" = " {used:0.1f}G";
          "max-length" = 10;
        };
      };
    };
    style = ''
      * {
          font-family: "${config.hostSpec.theme.font.base}";
          font-size: 16px;
      }

      window#waybar {
          background-color: rgba(26, 27, 38, 0.5);
          color: #ffffff;
          transition-property: background-color;
          transition-duration: 0.5s;
          border-top: 8px transparent;
          border-radius: 8px;
          transition-duration: 0.5s;
          margin: 16px 16px;
      }

      window#waybar.hidden {
           opacity: 0.2;
      }

      #cpu,
      #memory{
        padding: 0 10px;
        color: #e5e5e5;
        /* color: #bf616a; */
        border-radius: 9.5px;
        background-color: #1f2530;
      }

      #custom-launcher {
          background-color: #1b242b;
          color: #6a92d7;
          border-radius: 7.5px;
          padding: 0 3px;
      }

      #cpu {
        color: #fb958b;
        background-color: #1f2530;
      }

      #memory {
        color: #ebcb8b;
        background-color: #1f2530;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }
    '';
  };
}
