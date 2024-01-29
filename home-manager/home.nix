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
    neofetch
    vscode
    kotlin
    jdk17
    nodejs_21
    unstable.flutter
    unstable.jetbrains.idea-community
  ];
  
  
}
