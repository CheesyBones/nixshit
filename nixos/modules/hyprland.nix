{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang"; # Forces generation of a valid .conf file

    settings = {
      monitor = [
        ",preferred,auto,1.2"
      ];

      exec-once = [
        "waypaper --restore"
        "swaync"
        "hypridle"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 1;
        gaps_out = 2;
        border_size = 1;
        resize_on_border = true;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          vibrancy = 0.16;
        };
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };

      dwindle = {
        preserve_split = true;
      };

      misc = {
        disable_hyprland_logo = true;
      };

      bind = [
        # --- App Launching & Core System ---
        "SUPER, L, exec, hyprlock"
        "SUPER, T, exec, kitty"
        "SUPER, F, exec, nemo"
        "SUPER, B, exec, brave"
        "SUPER, SPACE, exec, rofi -show drun"
        "SUPER, R, exec, rofi -show run"
        "SUPER, Q, killactive"
        "SUPER, M, exit"
        "SUPER, P, pseudo," # added from Lua
        "SUPER, J, togglesplit," # added from Lua

        # --- Window States ---
        "SUPER ALT, T, togglefloating,"
        "SUPER ALT, F, fullscreen,"

        # --- Focus / Move Windows (Directional) ---
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        "SUPER ALT, left, movewindow, l"
        "SUPER ALT, right, movewindow, r"
        "SUPER ALT, up, movewindow, u"
        "SUPER ALT, down, movewindow, d"

        # --- Workspace Navigation (Relative) ---
        "SUPER SHIFT, left, workspace, r-1"
        "SUPER SHIFT, right, workspace, r+1"

        # --- Special Workspace (Scratchpad) ---
        "SUPER, S, togglespecialworkspace, magic"
        "SUPER SHIFT, S, movetoworkspace, special:magic"

        # --- Workspaces [1-10] Macros ---
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        # --- Workspace Scrolling via Mouse ---
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      # e flag = repeatable when held down
      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_SINK@ 5%+"
        ", F2,                   exec, wpctl set-volume -l 1.5 @DEFAULT_SINK@ 5%+"

        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
        ", F1,                   exec, wpctl set-volume @DEFAULT_SINK@ 5%-"

        ", XF86MonBrightnessUp,   exec, brightnessctl set 5%+"
        ", F6,                   exec, brightnessctl set 5%+"

        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", F5,                   exec, brightnessctl set 5%-"
      ];

      # l flag = works even when screen is locked (for mutes & player controls)
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
}
