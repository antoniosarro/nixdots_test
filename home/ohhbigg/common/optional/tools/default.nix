{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      # Development
      
      # Device Imaging
      
      # Productivity
      
      drawio
      libreoffice
      obsidian
      # Security
      
      bitwarden
      # Media
      
      obs-studio
      freetube
      # VM
      
      remmina
      # Other
      
      android-file-transfer
      localsend
      ;
  };
}
