# 
# i3 config file (v4)
# Please see https://i3wm.org/docs/userguide.html for a complete reference!
#

# Set the mod key
set $mod Mod4
# set $mod Mod1

# Reload the configuration file or restart i3 inplace
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart

#------------------Execute on startup
# Set HDMI left of DisplayPort
# exec xrandr --output HDMI-0 --left-of DP-0 --auto

# Merge .Xresources
exec_always xrdb -merge ~/.Xresources

# Disable screen timeout (use Alt+Shift+Q for screen sleep manually)
# exec xset s off dpms 0 0 0

# Compositing
exec picom

# Blueman
exec blueman-applet

# Set finnish keyboard layout
exec setxkbmap fi

# Set sensible fucking mouse acceleration
# exec_always xinput set-prop pointer:'Logitech MX Master' 'libinput Accel Speed' -0.7

# Set wallpaper from symlinked file
# Good background colors:
# #008080 / Windows 98 wallpaper cyan
# #F56966 / A good pink
# #CD4867 / A different good pink
# #020208 / Really dark blue
exec_always feh --bg-fill --no-fehbg $HOME/.wallpaper

#------------------Application shortcuts
# Power options (shutdown, reboot, log out)
bindsym $mod+Escape exec $HOME/bin/dmenu_poweropt

# Switch keymaps between fi and us (general use and programming, essentially)
bindsym $mod+u exec setxkbmap fi
bindsym $mod+Shift+u exec setxkbmap us

# Sleep display
# Will fuck up without the --release option
bindsym --release $mod+Shift+q exec xset dpms force standby

# Screenshot selectable area
# doesn't work and don't know why
# bindsym $mod+Shift+s exec scrot -s -d 0.5

# Media keys
# Set the default sink in pavucontrol
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# Start a terminal window, in a floating window by adding shift
# bindsym $mod+Return exec i3-sensible-terminal
# bindsym $mod+Return exec gnome-terminal
bindsym $mod+Return exec st
bindsym $mod+Shift+Return exec st -n st-floating

# Start dmenu with history (~/bin/)
# bindsym $mod+d exec dmenu_run
bindsym $mod+d exec $HOME/bin/dmenu_run_history -nb "$black" -nf "$front_pri" -sb "$back_pri" -sf "$black"

# Web browser
bindsym $mod+g exec firefox
bindsym $mod+Shift+g exec firefox --private
# bindsym $mod+g exec brave
# bindsym $mod+Shift+g exec brave --incognito

# File browser
# bindsym $mod+n exec nemo
# bindsym $mod+n exec thunar
bindsym $mod+n exec nautilus

#------------------Special window instances
# Use xprop to fetch window classes etc.

# blueman-manager
for_window [class="Blueman-manager"] floating enable

# st instances set to floating
for_window [instance="st-floating"] floating enable, resize set 800 480, move position center, move down 260 px, move right 520px

# All Steam pop-up windows but NOT the main Steam window
for_window [class="Steam"] floating enable
for_window [title="Steam"] floating disable

# nvidia-settings
for_window [class="Nvidia-settings"] floating enable, resize set height 640, move position center

# File explorer
for_window [class="Nemo"] floating enable, resize set 1200 800, move position center
for_window [class="Thunar"] floating enable, resize set 1200 800, move position center
for_window [class="Nautilus"] floating enable, resize set 1200 800, move position center

# pavucontrol
for_window [class="Pavucontrol"] floating enable

# Lutris
for_window [class="Lutris"] floating enable

#------------------Visual
# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
#
# Default and recommended:
#font pango:monospace 10
#font pango:DejaVu Sans Mono 8
font pango:Noto Sans Display 10

# Set colors from Xresources
set_from_resource   $front_pri      i3wm.foreground #f0f0f0
set_from_resource   $back_pri       i3wm.color9     #f0f0f0
set_from_resource   $front_sec      i3wm.color13    #f0f0f0
set_from_resource   $back_sec       i3wm.color5     #f0f0f0
set_from_resource   $black          i3wm.background #000000

# class                     border      backgr.     text        indicator   child_border
client.focused              $back_pri   $back_pri   $black      $back_pri   $back_pri
client.unfocused            $back_sec   $back_sec   $front_sec  $back_sec   $back_sec
client.focused_inactive     $back_pri   $back_pri   $front_pri  $back_pri   $back_sec
# client.urgent
# client.placeholder
# client.background           $bg

# i3bar and status command
bar {
        # Only show when pressing modkey
	modifier $mod 
	mode hide

        # Disable system tray
        tray_output none

        colors {
            # class             border      background  text
            focused_workspace   $front_pri  $back_pri   $black
            active_workspace    $front_sec  $back_sec   $front_sec
            inactive_workspace  $back_sec   $back_sec   $front_sec
        }

        # NOTE: bumblebee-status themes with icons need Font Awesome version 4 precisely!
        # 5 will NOT have all icons required.
        font pango:Noto Sans Display, Noto Mono for Powerline 10
        status_command bumblebee-status \
            -m spotify pasink memory cpu network_traffic battery datetime \
            -p  spotify.format="{artist} - {title}" \
                datetime.format="%d.%m.%Y %H:%M:%S" \
                pasink.percent_change="5" pasink.limit="100" \
            -t iceberg-dark-powerline
}

# Border width
default_border pixel 2
default_floating_border pixel 2
# Hide edge borders
hide_edge_borders both

# Controlling gaps
# Toggle between 10px borders with Mod+Backspace
bindsym $mod+BackSpace \
    exec i3-msg gaps outer current set 0, \
    exec i3-msg gaps inner current toggle 10
# Keep adding horizontal gaps with Shift+Backspace
bindsym $mod+Shift+BackSpace \
    exec i3-msg gaps inner current set 10, \
    exec i3-msg gaps horizontal current plus 256
# Keep adding vertical gaps with Control+Backspace
bindsym $mod+Ctrl+BackSpace \
    exec i3-msg gaps inner current set 10, \
    exec i3-msg gaps vertical current plus 144


# also i am mad so this is important
bindsym $mod+Ctrl+Return open


#------------------Defining workspaces
# Define names for default workspaces for which we configure keybindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 " 1 "
set $ws2 " 2 "
set $ws3 " 3 "
set $ws4 " 4 "
set $ws5 " 5 "
set $ws6 " 6 "
set $ws7 " 7 "
set $ws8 " 8 too many "
set $ws9 " 9 far too many "

# Switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9

# Move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9

#------------------Window management
# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# Kill focused window
bindsym $mod+q kill

# Split containers
bindsym $mod+b split h
bindsym $mod+v split v

# Enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# Change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# Focus parent and child containers
bindsym $mod+a focus parent
bindsym $mod+Shift+a focus child

# Change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
# Alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# Move focused window
bindsym $mod+Shift+h move left 75 px
bindsym $mod+Shift+j move down 50 px
bindsym $mod+Shift+k move up 50 px
bindsym $mod+Shift+l move right 75 px
# Alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left 75 px
bindsym $mod+Shift+Down move down 50 px
bindsym $mod+Shift+Up move up 50 px
bindsym $mod+Shift+Right move right 75 px

# Resizing windows (you can also use mouse)
mode "resize" {
        # Shrinking windows with vim-style keys
        bindsym h resize shrink width 30 px or 10 ppt
        bindsym j resize grow height 30 px or 10 ppt
        bindsym k resize shrink height 30 px or 10 ppt
        bindsym l resize grow width 30 px or 10 ppt

        # Same bindings, but for the arrow keys
        bindsym Left resize shrink width 30 px or 10 ppt
        bindsym Down resize grow height 30 px or 10 ppt
        bindsym Up resize shrink height 30 px or 10 ppt
        bindsym Right resize grow width 30 px or 10 ppt

        # Back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}
# Bind resize-mode to key
bindsym $mod+r mode "resize"
# Mod+t for 1080p
bindsym $mod+t resize set width 1920 height 1080
