{ config, lib, pkgs, ... }:

let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/config1 | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
  '';

  rofi1 = pkgs.writeShellScriptBin "rofi1" ''
    ~/.config/rofi/launchers/type-1/launcher.sh
  '';
  rofi2 = pkgs.writeShellScriptBin "rofi2" ''
    ~/.config/rofi/launchers/type-2/launcher.sh
  '';
  rofiWindow = pkgs.writeShellScriptBin "rofiWindow" ''
    #!/usr/bin/env bash
    ## Run
    rofi \
        -show drun \
        -theme "$HOME/.config/rofi/theme.rasi"
  '';

  power_button = pkgs.writeShellScriptBin "power_button" ''
    #!/usr/bin/env bash
    ## /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##

    # wlogout (Power, Screen Lock, Suspend, etc)

    # Set variables for parameters
    A_2160=680
    B_2160=750
    A_1440=500
    B_1440=550
    A_1080=300
    B_1080=380
    A_720=50
    B_720=50

    # Check if wlogout is already running
    if pgrep -x "wlogout" > /dev/null; then
        pkill -x "wlogout"
        exit 0
    fi

    # Detect monitor resolution and scaling factor
    resolution=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height / .scale' | awk -F'.' '{print $1}')
    hypr_scale=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .scale')

    echo "Detected Resolution: $resolution"

    # Set parameters based on screen resolution and scaling factor
    if ((resolution >= 2160)); then
        wlogout --protocol layer-shell -b 3 -T $(awk "BEGIN {printf \"%.0f\", $A_2160 * 2160 * $hypr_scale / $resolution}") -B $(awk "BEGIN {printf \"%.0f\", $B_2160 * 2160 * $hypr_scale / $resolution}") &
        echo "Setting parameters for resolution >= 2160p"
    elif ((resolution >= 1440)); then
        wlogout --protocol layer-shell -b 6 -T $(awk "BEGIN {printf \"%.0f\", $A_1440 * 1440 * $hypr_scale / $resolution}") -B $(awk "BEGIN {printf \"%.0f\", $B_1440 * 1440 * $hypr_scale / $resolution}") &
        echo "Setting parameters for resolution >= 1440p"
    elif ((resolution >= 1080)); then
        wlogout --protocol layer-shell -b 6 -T $(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $hypr_scale / $resolution}") -B $(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $hypr_scale / $resolution}") &
        echo "Setting parameters for resolution >= 1080p"
    elif ((resolution > 720)); then
        wlogout --protocol layer-shell -b 3 -T $(awk "BEGIN {printf \"%.0f\", $A_720 * 720 * $hypr_scale / $resolution}") -B $(awk "BEGIN {printf \"%.0f\", $B_720 * 720 * $hypr_scale / $resolution}") &
        echo "Setting parameters for resolution >= 720p"
    else
        wlogout &
        echo "Setting default parameters for resolution <= 720p"
    fi
  '';

  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then
        killall dynamic_wallpaper
        swww img $(find ~/Imagens/wallpapers/. -name "*.png" | shuf -n1) --transition-type simple
    fi
  '';
  default_wall = pkgs.writeShellScriptBin "default_wall" ''
    if command -v swww >/dev/null 2>&1; then
          swww img ~/Imagens/wallpapers/menhera.jpg  --transition-type simple
    fi
  '';
in
{
  home.packages = with pkgs; [

    rofi1
    rofi2
    rofiWindow
    cava-internal
    wallpaper_random
    default_wall
    power_button
  ];
}
