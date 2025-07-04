#!/bin/bash

# === CONFIGURATION ===
THEME="Materal-Black-Blueberry"  # Change this to your preferred theme name

# === GTK 2 ===
echo "gtk-theme-name=\"$THEME\"" > ~/.gtkrc-2.0

# === GTK 3 ===
mkdir -p ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini <<EOF
[Settings]
gtk-theme-name=$THEME
gtk-application-prefer-dark-theme=true
EOF

# === GTK 4 ===
mkdir -p ~/.config/gtk-4.0
cat > ~/.config/gtk-4.0/settings.ini <<EOF
[Settings]
gtk-theme-name=$THEME
gtk-application-prefer-dark-theme=true
EOF

# === Add to shell profile (optional) ===
if ! grep -q "GTK_THEME=" ~/.profile; then
  echo "export GTK_THEME=$THEME" >> ~/.profile
fi

# === Add to sway config (optional) ===
if ! grep -q "setenv GTK_THEME" ~/.config/sway/config 2>/dev/null; then
  echo "setenv GTK_THEME $THEME" >> ~/.config/sway/config
fi

echo "✅ GTK theme applied: $THEME"
echo "🔄 Restart apps or your session to see changes."

