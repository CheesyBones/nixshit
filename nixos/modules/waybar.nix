{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true; # Ensures waybar starts automatically with your session

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 4;
        margin-top = 6;
        margin-left = 8;
        margin-right = 8;

        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "cpu" "memory" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          active-only = false;
          format = "{name}";
        };

        "clock" = {
          timezone = "America/Los_Angeles";
          format = "󰸗 {:%a %b %d  |  󱑒 %I:%M %p}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          format = "  {usage}%";
          tooltip = false;
        };

        "memory" = {
          format = "  {}%";
        };

        "network" = {
          format-wifi = "   {essid}";
          format-ethernet = "󰈀  {ipaddr}/{cidr}";
          format-disconnected = "󰖪  Disconnected";
          tooltip-format = "{ifname} via {gwaddr} 󰊗";
        };

        "pulseaudio" = {
          format = "{icon}  {volume}%";
          format-muted = "󰝟  Muted";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pavucontrol";
        };

        "tray" = {
          icon-size = 16;
          spacing = 10;
        };
      };
    };

    # Beautiful minimal CSS layout structure.
    # Stylix automatically injects the background, border, and text colors!
    style = ''
      window#waybar {
        background-color: transparent;
      }

      .modules-left, .modules-center, .modules-right {
        background: @theme_base_color; /* Handled by Stylix */
        border: 1px solid @theme_border_color;
        border-radius: 12px;
        padding: 2px 12px;
      }

      #workspaces button {
        padding: 0 8px;
        color: @theme_text_color;
        border-radius: 8px;
        transition: all 0.3s ease;
      }

      #workspaces button.active {
        background-color: @theme_selected_bg_color;
        color: @theme_selected_fg_color;
      }

      #workspaces button:hover {
        background-color: rgba(255, 255, 255, 0.1);
      }

      #clock, #cpu, #memory, #network, #pulseaudio, #tray {
        padding: 0 10px;
        margin: 0 2px;
      }
    '';
  };
}
