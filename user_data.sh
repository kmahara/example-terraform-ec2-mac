#!/bin/sh

# Enable VNC
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart \
-activate \
-configure -access -on -privs -all \
-restart -agent

# Set hostname
scutil --set HostName ${hostname}
scutil --set ComputerName ${hostname}

# Set desktop picture to know users which environment is using.
osascript -e "tell application \"System Events\" to set picture of current desktop to \"${desktop_picture_path}\""

# Install tools (long time)
su ec2-user -c "brew install coteditor iterm2"
