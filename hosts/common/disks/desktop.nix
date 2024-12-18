{
  pkgs,
  config,
  ...
}: {
  disko.devices = {
    disk = {
      primary = {
        type = "disk";
        device = "/dev/nvme1n1"; # 500GB
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["defaults"];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "cryptprimary";
                passwordFile = "/tmp/disko-password";
                settings = {
                  allowDiscards = true;
                  bypassWorkqueues = true;
                  crypttabExtraOpts = [
                    "fido2-device=auto"
                    "token-timeout=10"
                  ];
                };
                content = {
                  type = "btrfs";
                  extraArgs = ["-f"];
                  subvolumes = {
                    "@root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "@/home" = {
                      mountpoint = "/home";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };

  environment.systemPackages = [
    pkgs.yubikey-manager
  ];
}
