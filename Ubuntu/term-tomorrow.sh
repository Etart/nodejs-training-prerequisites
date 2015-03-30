#!/bin/sh

# because gconftool doesn't have "append"
glist_append() {
  local type="$1"; shift
  local key="$1"; shift
  local val="$1"; shift

  local entries="$(
    {
      gconftool --get "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
      echo "$val"
    } | head -c-1 | tr "\n" ,
  )"

  gconftool --set --type list --list-type $type "$key" "[$entries]"
}

# append the Tomorrow profile to the profile list
glist_append string /apps/gnome-terminal/global/profile_list 'Tomorrow'

gconftool --set --type string /apps/gnome-terminal/profiles/Tomorrow/visible_name -- 'Tomorrow'
gconftool --set --type string /apps/gnome-terminal/profiles/Tomorrow/palette -- '#7F7F8C8C8D8D:#F4F48C8C8C8C:#A7A7D1D1A8A8:#FFFFD1D17E7E:#7878A8A8D2D2:#D4D4AAAAD3D3:#7878D2D2D3D3:#FFFFFFFFFFFF:#A8A8A7A7A7A7:#F4F48C8C8C8C:#A7A7D1D1A8A8:#FFFFD1D17E7E:#7878A8A8D2D2:#D4D4AAAAD3D3:#7878D2D2D3D3:#FFFFFFFFFFFF'
gconftool --set --type string /apps/gnome-terminal/profiles/Tomorrow/background_color -- '#2A2A2A2A2A2A'
gconftool --set --type string /apps/gnome-terminal/profiles/Tomorrow/foreground_color -- '#D4D4D4D4D4D4'
gconftool --set --type string /apps/gnome-terminal/profiles/Tomorrow/bold_color -- '#FFFFFFFFFFFF'
gconftool --set --type string /apps/gnome-terminal/profiles/Tomorrow/font -- 'Ubuntu Mono 18'
gconftool --set --type bool /apps/gnome-terminal/profiles/Tomorrow/use_system_font -- false
gconftool --set --type bool /apps/gnome-terminal/profiles/Tomorrow/use_theme_colors -- false
gconftool --set --type bool /apps/gnome-terminal/profiles/Tomorrow/bold_color_same_as_fg -- false
gconftool --set --type bool /apps/gnome-terminal/profiles/Tomorrow/use_theme_background -- false
gconftool --set --type bool /apps/gnome-terminal/profiles/Tomorrow/allow_bold -- true
gconftool --set --type bool /apps/gnome-terminal/profiles/Tomorrow/default_show_menubar -- true
