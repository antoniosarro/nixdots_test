{
  config,
  pkgs,
  lib,
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
        modules-left = ["custom/launcher" "cpu" "memory" "hyprland/workspaces"];
        modules-center = [];
        modules-right =
          [
            "tray"
          ]
          ++ lib.optional (config.hostSpec.hostName == "laptop") "backlight"
          ++ [
            "pulseaudio"
            "network"
          ]
          ++ lib.optional (config.hostSpec.hostName == "laptop") "battery"
          ++ ["clock" "custom/power-menu"];

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
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
        };

        # ============================
        # Module Center
        # ============================

        # ============================
        # Module Right
        # ============================
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

      #workspaces button {
        padding: 0 5px;
        color: #7984A4;
        background-color: transparent;
        /* Use box-shadow instead of border so the text isn't offset */
        box-shadow: inset 0 -3px transparent;
        /* Avoid rounded borders under each workspace name */
        border: none;
        border-radius: 0;
      }

      #workspaces button.focused {
        color: #bf616a;
      }

      #workspaces button.active {
        color: #6a92d7;
      }

      #workspaces button.urgent {
        background-color: #eb4d4b;
      }

      #window {
        /* border-radius: 20px; */
        /* padding-left: 10px; */
        /* padding-right: 10px; */
        color: #64727d;
      }

      #cpu,
      #memory{
        padding: 0 10px;
        color: #e5e5e5;
        /* color: #bf616a; */
        border-radius: 9.5px;
        background-color: #1f2530;
      }


      #window,
      #workspaces {
        margin: 0 4px;
        border-radius: 7.8px;
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
