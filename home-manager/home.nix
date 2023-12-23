{ config, pkgs, ...}:

{
  # if you config gets too long, split it up into smaller modules
  # imports = [
  #   ./git # looks for ./git/defualt.nix
  #   ./hypr/hyprland.nix # looks for ./hypr/hyprland.nix
  #  ];
    
  # The User and Path it manages
  home.username = "thalene";
  home.homeDirectory = "/home/thalene";
  home.stateVersion = "23.11";
  
  # Let Home Manager manage itself
  programs.home-manager.enable = true;
  
  # List of user programs
  home.packages = with pkgs; [
    unstable.lutris
    appimage-run
    prismlauncher
  ];
  
  
}
