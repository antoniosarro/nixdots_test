{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    # ============================
    # Main Key
    # ============================
    "$mainMod" = "SUPER";

    # ============================
    # Mouse Binds
    # ============================
    bindm = [
      "ALT,mouse:272,movewindow"
      "ALT,mouse:273,resizewindow"
    ];

    # ============================
    # Repeat Binds
    # ============================
    binde = [
      # Resize active window 30 pixels in direction
      "$mainMod SHIFT, right, resizeactive, 30 0"
      "$mainMod SHIFT, left, resizeactive, -30 0"
      "$mainMod SHIFT, up, resizeactive, 0 -30"
      "$mainMod SHIFT, down, resizeactive, 0 30"

      # Audio
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

      # Brightness
      ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
    ];

    # ============================
    # One-Click Binds
    # ============================
    bind = let
      terminal = config.home.sessionVariables.TERM;
      editor = config.home.sessionVariables.EDITOR;

      workspaces = [
        "0"
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
      ];
    in
      lib.flatten [
        # Quick Launch
        "ALT,space,exec,${pkgs.rofi}/bin/rofi -show drun"
        "SUPER,s,exec,${pkgs.rofi}/bin/rofi -show ssh"
        "ALT,tab,exec,${pkgs.rofi}/bin/rofi -show window"

        "ALT,Return,exec,${terminal}"
        "CTRL_ALT,v,exec,${terminal} ${editor}"
        "CTRL_ALT,f,exec,thunar"

        # Screenshotting
        "CTRL_ALT,p,exec,${pkgs.grimblast}/bin/grimblast --notify --freeze copy area"
        ",Print,exec,${pkgs.grimblast}/bin/grimblast --notify --freeze copy area"

        # Audio
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Player
        ", XF86AudioPlay, exec, '${pkgs.playerctl}/bin/playerctl --ignore-player=firefox,chromium,brave play-pause'"
        ", XF86AudioNext, exec, '${pkgs.playerctl}/bin/playerctl --ignore-player=firefox,chromium,brave next'"
        ", XF86AudioPrev, exec, '${pkgs.playerctl}/bin/playerctl --ignore-player=firefox,chromium,brave previous'"

        # Close focused/active window
        "SHIFTALT,q,killactive"

        # Fullscreen
        "ALT,f,fullscreenstate,2 -1" # `internal client`, where `internal` and `client` can be -1 - current, 0 - none, 1 - maximize, 2 - fullscreen, 3 - maximize and fullscreen
        "SHIFTALT,F,togglefloating"
        "SHIFTALT, p, pin, active"

        # Workspaces
        (map (n: "$mainMod,${n},workspace,name:${n}") workspaces)
        (map (n: "$mainMod SHIFT,${n},movetoworkspace,name:${n}") workspaces)
        # Misc
      ];
  };
}
