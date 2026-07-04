{ config, pkgs, lib, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      # Use lib.mkForce to completely override Stylix's background format
      background = lib.mkForce [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%H:%M\")\"";
          font_size = 72;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 120";
          halign = "center";
          valign = "center";
        }
      ];

      # Use lib.mkForce here too to stop the input-field type-check collision
      input-field = lib.mkForce [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 2;

          dots_size = 0.2;
          dots_spacing = 0.35;
          dots_center = true;

          fade_on_empty = false;
          rounding = 12;

          position = "0, -80";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
