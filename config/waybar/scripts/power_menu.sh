#!/bin/bash

choice=$(printf "🔒 Lock\n📴 Shutdown\n🔁 Reboot\n🚪 Log Out" | wofi --dmenu --width 200 --height 200)

case "$choice" in
  "📴 Shutdown") systemctl poweroff ;;
  "🔁 Reboot") systemctl reboot ;;
  "🚪 Log Out") swaymsg exit ;;
  "🔒 Lock") swaylock ;;
esac

