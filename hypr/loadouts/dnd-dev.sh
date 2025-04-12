#!/bin/bash

# Workspace 1 - Spotify
hyprctl dispatch workspace 1
flatpak run com.spotify.Client &

# --- Workspace 2: Three Kitty Terminals Split Layout ---

# Terminal 1: open nvim in root dir
kitty --title term1 -e sh -c 'cd /home/abhaybir/Documents/Coding-Projects/DNDSystem && exec nvim' &
sleep 0.8

# Split right from terminal 1
hyprctl dispatch workspace 2
hyprctl dispatch layoutmsg splitright
sleep 0.5

# Focus back to the left (term1), then right again for a clean state
hyprctl dispatch focus left
sleep 0.2
hyprctl dispatch focus right
sleep 0.2

# Terminal 2: open in server dir
kitty --title term2 -e sh -c 'cd /home/abhaybir/Documents/Coding-Projects/DNDSystem/Server && exec bash' &
sleep 0.8

# Split down from terminal 2 (right pane)
hyprctl dispatch layoutmsg splitdown
sleep 0.5

# Focus down (to prepare for term3)
hyprctl dispatch focus down
sleep 0.2

# Terminal 3: open in frontend dir
kitty --title term3 -e sh -c 'cd /home/abhaybir/Documents/Coding-Projects/DNDSystem/Client/dndsystemsfrontend && exec bash' &

# Workspace 3 - Zen general
hyprctl dispatch workspace 3
flatpak run app.zen_browser.zen --user-data-dir=/home/abhaybir/.zen-default --new-window --title="Zen Default" &

sleep 1

# Workspace 4 - Zen localhost
hyprctl dispatch workspace 4
flatpak run app.zen_browser.zen \
  --user-data-dir=/home/abhaybir/.zen-ws4 \
  --new-window "http://localhost:5173" \
  --title="Zen Localhost" &


# Workspace 6 - MongoDB Compass + Insomnia
sleep 1
hyprctl dispatch workspace 6
mongodb-compass &
sleep 0.5
flatpak run rest.insomnia.Insomnia &

