# 
# i3 config file (v4)
# Please see https://i3wm.org/docs/userguide.html for a complete reference!
#

# Set the mod key
set $mod Mod1

# Reload the configuration file or restart i3 inplace
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart

#------------------Execute on startup
# Merge .Xresources
exec_always xrdb -merge ~/.Xresources
# Disable screen timeout
exec xset s off dpms 0 0 0
# Set wallpaper from symlinked file
# Good background colors:
# #008080 / Windows 98 wallpaper cyan
# #F56966 / A good pink
# #CD4867 / A different good pink
# #020208 / Really dark blue
exec_always feh --bg-center --image-bg "#020208" --no-fehbg $HOME/.wallpaper
# Set sensible fucking mouse acceleration
exec xinput set-prop pointer:'Logitech MX Master' 296 -0.6
# Set finnish keyboard layout
exec setxkbmap fi

#------------------Application shortcuts
# Switch keymaps between fi and us (general use and programming, essentially)
bindsym $mod+u exec setxkbmap fi
bindsym $mod+Shift+u exec setxkbmap us

# Sleep display
# Will fuck up without the --release option
bindsym --release $mod+Shift+q exec xset dpms force standby

# Media keys
# Set the default sink in pavucontrol
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# Start a terminal window, in a floating window by adding shift
# Default:
#bindsym $mod+Return exec i3-sensible-terminal
bindsym $mod+Return exec st
bindsym $mod+Shift+Return exec st -n floating

# Start dmenu with history (~/bin/)
# NOTE: script changed to point to /opt/bin/dmenu for center mod. Vanilla dmenu is installed via pacman for surf to properly position dmenu as a URL-bar. Their config.h is symlinked for consistent looks.
#bindsym $mod+d exec dmenu_run_history
bindsym $mod+d exec dmenu_run

# Web browser
#bindsym $mod+g exec surf google.com
bindsym $mod+g exec firefox
bindsym $mod+Shift+g exec firefox --private

# File browser
bindsym $mod+n exec nemo

#------------------Special window instances
# Use xprop to fetch window classes etc.

# st instances set to floating
for_window [class="st-256color" instance="floating"] floating enable, resize set 640 400, move position center, move down 280 px, move right 520 px

# All Steam pop-up windows but NOT the main Steam window
for_window [class="Steam"] floating enable
for_window [title="Steam"] floating disable

# nvidia-settings
for_window [class="Nvidia-settings"] floating enable, resize set height 640, move position center

# Nemo
#for_window [class="Nemo"] floating enable, resize set 1200 800

# pavucontrol
for_window [class="Pavucontrol"] floating enable

#------------------Visual
# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
#
# Default and recommended:
#font pango:monospace 10
#font pango:DejaVu Sans Mono 8
font pango:Noto Sans Display 8

# Set colors from Xresources
#set_from_resource $fg i3wm.color7
#set_from_resource $bg i3wm.color2
# class                 border  backgr. text indicator child_border
#client.focused          $fg     $bg     $fg  $bg       $fg
#client.focused_inactive $bg     $bg     $fg  $bg       $bg
#client.unfocused        $bg     $bg     $fg  $bg       $bg
#client.urgent           $bg     $bg     $fg  $bg       $bg
#client.placeholder      $bg     $bg     $fg  $bg       $bg
#
#client.background       $bg

# i3bar and status command
bar {
        # Only show when pressing modkey
	mode hide
	modifier $mod 
        # Disable system tray
        tray_output none

        # NOTE: bumblebee-status themes with icons need Font Awesome version 4 precisely!
        # 5 will NOT have all icons required.
	font pango:Noto Sans Display, FontAwesome 9
        status_command bumblebee-status \
            -m spotify amixer memory network_traffic datetime \
            -p spotify.format="{artist} - {title}" datetime.format="%d.%m.%Y %H:%M:%S" \
            -t greyish-powerline
}

# Border width
default_border pixel 3
default_floating_border pixel 3
# Hide edge borders
hide_edge_borders both

# Controlling gaps
# Keep adding horizontal gaps with backspace
bindsym $mod+BackSpace exec i3-msg gaps inner current plus 5, \
    exec i3-msg gaps horizontal current plus 50, \
    exec i3-msg gaps vertical current set 10
# Undo all gaps with shift+backspace
bindsym $mod+Shift+BackSpace exec i3-msg gaps outer current set 0, \
    exec i3-msg gaps inner current set 0

# also i am mad so this is important
bindsym $mod+Ctrl+BackSpace open

#------------------Defining workspaces
# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8 too many"
set $ws9 "9 far too many"

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
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # Same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # Back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}
# Bind resize-mode to key
bindsym $mod+r mode "resize"
bindsym $mod+t resize set width 1920
