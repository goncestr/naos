{ config, pkgs, ... }:

   let
     naosDir = "${config.home.homeDirectory}/naos";
                
   in {
   
   imports = [ 
   "${naosDir}/modules/import.nix"
   ];
   
  home.username = "asus";
  home.homeDirectory = homeDir;

  home.stateVersion = "25.05";
  
  home.sessionVariables = {
    EDITOR = "neovim";
    TERMINAL = "kitty";
  };
  programs.home-manager.enable = true;
}
