{ config, pkgs, ... }:

let
  confD = "${config.home.homeDirectory}/naos/.config";
  hycd= "${confD}/hypr";
     
     configDirs = {
       "waybar" = "${confD}/waybar";
       "hypr" = "${hycd}";
       };
       
in {
  home.packages = with pkgs; [
    hyprland
    xdg-desktop-portal-hyprland
    brightnessctl
    playerctl
    wl-clipboard
    pavucontrol
    font-awesome_6
    waybar    
    fuzzel
    mako
    wofi-emoji    
    clock-rs
    kitty
    nautilus
    grim
    slurp
  ];

  xdg.configFile = builtins.mapAttrs (name: path: { source = path; recursive = true; }) configDirs;

  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    GTK_USE_PORTAL = "1";
  };

}
