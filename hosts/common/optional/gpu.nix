{pkgs, ...}: {
  environment.systemPackages = [pkgs.lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
}
