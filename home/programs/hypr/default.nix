{ config, lib, pkgs, ... }:

{
  imports = [
    ./hyprland-environment.nix
  ];

  home.packages = with pkgs; [
    waybar
    swww
  ];

  home.file.".config/hypr/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    package = pkgs.hyprland;
    enable = true;
    systemd.enable = true;
    systemd.enableXdgAutostart = true;
    xwayland.enable = true;
    extraConfig = ''

  $hyprScriptsDir = $HOME/.config/hypr/scripts
    # Monitor
    monitor=DP-2,highres,auto,1
    monitor=Unknown-1, disable

    # Autostart
    exec-once = dunst

    source = /home/tomasz/.config/hypr/colors
    exec = pkill waybar & sleep 0.5 && waybar
    exec-once = swww init & sleep 0.5

    # Input config
    input {
        kb_layout = pl
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =

        follow_mouse = 2

        touchpad {
            natural_scroll = false
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }

    general {
        gaps_in = 3
        gaps_out = 8
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
        resize_on_border = true

        layout = dwindle
    }

       animations {
          enabled = true
          # Animation curves

          bezier = linear, 0, 0, 1, 1
          bezier = md3_standard, 0.2, 0, 0, 1
          bezier = md3_decel, 0.05, 0.7, 0.1, 1
          bezier = md3_accel, 0.3, 0, 0.8, 0.15
          bezier = overshot, 0.05, 0.9, 0.1, 1.1
          bezier = crazyshot, 0.1, 1.5, 0.76, 0.92
          bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
          bezier = fluent_decel, 0.1, 1, 0, 1
          bezier = easeInOutCirc, 0.85, 0, 0.15, 1
          bezier = easeOutCirc, 0, 0.55, 0.45, 1
          bezier = easeOutExpo, 0.16, 1, 0.3, 1
          # Animation configs
          animation = windows, 1, 3, md3_decel, popin 60%
          animation = border, 1, 10, default
          animation = fade, 1, 2.5, md3_decel
          # animation = workspaces, 1, 3.5, md3_decel, slide
          animation = workspaces, 1, 3.5, easeOutExpo, slide
          # animation = workspaces, 1, 7, fluent_decel, slidefade 15%
          # animation = specialWorkspace, 1, 3, md3_decel, slidefadevert 15%
          animation = specialWorkspace, 1, 3, md3_decel, slidevert
        }

    dwindle {
        pseudotile = yes
        preserve_split = yes
    }

    master {
        new_is_master = yes
    }

    gestures {
               workspace_swipe = true
               workspace_swipe_fingers = 3
           }

    # Example windowrule v1
    # windowrule = float, ^(kitty)$
    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

    windowrule=float,^(alacrityy)$
    windowrule=float,^(pavucontrol)$
    windowrule=center,^(alacrityy)$
    windowrule=float,^(blueman-manager)$
    windowrule=size 600 500,^(alacrityy)$
    windowrule=size 934 525,^(mpv)$
    windowrule=float,^(mpv)$
    windowrule=center,^(mpv)$
    #windowrule=pin,^(firefox)$

    $mainMod = SUPER
    bind = $mainMod, G, fullscreen,


    bind = $mainMod, RETURN, exec, alacritty
    bind = $mainMod, B, exec, brave
    bind = $mainMod, Q, killactive,
    bind = $mainMod, M, exit,
    bind = $mainMod, F, exec, nautilus
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, w, exec, wofi --show drun
    bind = $mainMod, R, exec, rofiWindow
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle

    # Switch Keyboard Layouts
    bind = $mainMod, SPACE, exec, hyprctl switchxkblayout teclado-gamer-husky-blizzard next

    bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
    bind = SHIFT, Print, exec, grim -g "$(slurp)"

    # Functional keybinds
    bind =,XF86AudioMicMute,exec,pamixer --default-source -t
    bind =,XF86MonBrightnessDown,exec,light -U 20
    bind =,XF86MonBrightnessUp,exec,light -A 20
    bind =,XF86AudioMute,exec,pamixer -t
    bind =,XF86AudioLowerVolume,exec,pamixer -d 10
    bind =,XF86AudioRaiseVolume,exec,pamixer -i 10
    bind =,XF86AudioPlay,exec,playerctl play-pause
    bind =,XF86AudioPause,exec,playerctl play-pause

    # to switch between windows in a floating workspace
    bind = SUPER,Tab,cyclenext,
    bind = SUPER,Tab,bringactivetotop,

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
    bindm = ALT, mouse:272, resizewindow
        '';
  };

  home.file.".config/hypr/colors".text = ''
    $background = rgba(1d192bee)
    $foreground = rgba(c3dde7ee)

    $color0 = rgba(1d192bee)
    $color1 = rgba(465EA7ee)
    $color2 = rgba(5A89B6ee)
    $color3 = rgba(6296CAee)
    $color4 = rgba(73B3D4ee)
    $color5 = rgba(7BC7DDee)
    $color6 = rgba(9CB4E3ee)
    $color7 = rgba(c3dde7ee)
    $color8 = rgba(889aa1ee)
    $color9 = rgba(465EA7ee)
    $color10 = rgba(5A89B6ee)
    $color11 = rgba(6296CAee)
    $color12 = rgba(73B3D4ee)
    $color13 = rgba(7BC7DDee)
    $color14 = rgba(9CB4E3ee)
    $color15 = rgba(c3dde7ee)
  '';
}

