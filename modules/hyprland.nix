{ config, pkgs, ... }:

let
  hmdir = "/home/asus";
  confD = "${hmdir}/naos/.config";
     
     configDirs = {
       "waybar" = "${confD}/waybar";
       "hypr" = "${confD}/hypr";
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
