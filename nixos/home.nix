{ config, pkgs, stylix, ... }:

{
  programs.waybar.enable = true;
  services.swaync.enable = true;
  services.hypridle.enable = true;

  home.packages = with pkgs; [
    waypaper
    swww
    nerd-fonts.jetbrains-mono
  ];

  stylix.targets = {
    kitty.enable = true;
    waybar.enable = true;
    hyprland.enable = true;
    gtk.enable = true;
    qt.enable = true;
    kde.enable = true;
  };

  imports = [
    ./modules/hyprland.nix
    ./modules/hypridle.nix
    ./modules/hyprlock.nix
    ./modules/waybar.nix
  ];

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

    };
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi; # Explicitly forces the Wayland fork
  };

  home.username = "charliet";   # your username
  home.homeDirectory = "/home/charliet";
  home.stateVersion = "26.05";
}
