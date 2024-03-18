{ config, pkgs, ...}:

{
    
  # The User and Path it manages
  home.username = "farnese";
  home.homeDirectory = "/home/farnese";
  home.stateVersion = "23.11";
  
  # Let Home Manager manage itself
  programs.home-manager.enable = true;
  
  # List of user programs
  home.packages = with pkgs; [
    brave
    spotify
    telegram-desktop
    discord
    neofetch
    vscode
    lutris
    steam
    heroic
  ];
  
  
}
