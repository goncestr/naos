{ pkgs, config, ...}:

  {   
   home.packages = with pkgs; [
       onlyoffice-desktopeditors
       vscode
       neovim
       font-awesome
       catppuccin-gtk
       papirus-icon-theme
       swaylock-effects
       gruvbox-kvantum
       floorp
       catppuccin-kvantum
  ];

  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
  
  }
