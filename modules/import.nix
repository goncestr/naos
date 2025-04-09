{ config, pkgs, lib, ... }:

let
  homeDir = config.home.homeDirectory;
  modulesDir = "${homeDir}/naos/modules";

  moduleFiles = builtins.attrNames (builtins.readDir modulesDir);

  nixFiles = builtins.filter (name: lib.hasSuffix ".nix" name) moduleFiles;

  fullPaths = builtins.map (name: "${modulesDir}/${name}") nixFiles;
in
{
  imports = fullPaths;
}
