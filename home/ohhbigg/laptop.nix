{...}: {
  imports = [
    # ============================
    # Hardware Required Configs
    # ============================
    common/core

    # ============================
    # Host-specific Configs
    # ============================
    common/optional/browsers
    common/optional/desktops
    common/optional/gaming
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      primary = true;
    }
  ];
}
