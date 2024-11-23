# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./services.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #fonts.fontDir.enable = true;

  # Region
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # User Account 
  users.users.ohf = {
    isNormalUser = true;
    description = "ohf";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };
 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Audio
  sound.enable = true;
  security.rtkit.enable = true;
  
  # Networking
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Power
  powerManagement.cpuFreqGovernor = "performance";

  system.stateVersion = "24.05"; 
}
