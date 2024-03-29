{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];  
  #Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  #Performance
  powerManagement.cpuFreqGovernor = "performance";
  
  #Nonfree 
  nixpkgs.config.allowUnfree = true; 

  #Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #Bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices =  ["nodev"];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;

  #Bluetooth
  hardware.bluetooth.enable = true;

  #Services
  services = {
    blueman.enable = true;
    gvfs.enable = true;
    logmein-hamachi.enable = true;
   };
 
  #Hostname
  networking.hostName = "nixos";

  #Timezone
  time.timeZone = "America/Argentina/Buenos_Aires";

  #Lang
  i18n.defaultLocale = "es_AR.UTF-8";
  console = {
    # keyMap = "la-latin1";
     useXkbConfig = true; 
   };

  #X11 (Because Wayland sucks, Chad Xorg+NVIDIA)
  services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      windowManager.bspwm.enable = true;
     # desktopManager.gnome.enable = true;
      videoDrivers = [ "nvidia" ];  
      layout = "latam";
      excludePackages = [ pkgs.xterm ];
  };
  
  hardware = {
     opengl.enable = true;
     opengl.driSupport32Bit = true;
    };

  #Sound
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;   
   };

  #User
  users.users.farnese = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     shell = pkgs.fish;
  };

  #PKG
  environment.systemPackages = with pkgs; [
     #System
     kitty
     feh
     sxhkd
     polybar
     picom
     rofi
     pcmanfm
     gnome.file-roller
     flameshot
     scrot
     pavucontrol
     etcher
    
     #CLI
     git
     wget
     curl
     htop
     openssl
     #Lib
     jdk17
     jdk8

     #GTK
     tokyo-night-gtk
     papirus-icon-theme
     lxappearance
   ];

  #Git
  programs = { 
    ssh.enableAskPassword = false; 
    fish.enable = true;
    steam.enable = true;
   };

  #Fonts
  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

