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
    spotify-tray
    telegram-desktop
    discord
    neofetch
    vscode
    jetbrains.idea-community
    lutris
    steam-run
    heroic
    libreoffice-still
    musescore
    obs-studio
    gimp
    libsForQt5.kdenlive
    
    logmein-hamachi
    haguichi
  ];
  
  
}
