{ config, pkgs, ... }:

   let
     homeDir = "/home/asus"
        configDirs = {
           "waybar" = "${homeDir}/naos/.config/waybar";
           "hypr" = "${homeDir}/naos/.config/hypr";
           };
           
   in {
  home.username = "asus";
  home.homeDirectory = homeDir;

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
       pkgs.nerd-fonts.iosevka-term
       waybar
       fuzzel
       mako
       wofi-emoji
       clock-rs
       kitty
       nautilus
       pavucontrol
       grim
       slurp
       fastfetch
  ];

  xdg.configFile = builtins.mapAttrs (name: path: { source = path; recursive = true; }) configDirs;
  
  home.sessionVariables = {
    EDITOR = "neovim";
    TERMINAL = "kitty";
  };
  programs.home-manager.enable = true;
}
