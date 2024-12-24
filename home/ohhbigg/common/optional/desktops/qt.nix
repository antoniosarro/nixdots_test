{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = {
      name = "gtk2";
      package = pkgs.qt6Packages.qt6gtk2;
    };
  };
}
