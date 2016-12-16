#!/usr/bin/env bash
# -*- coding: utf-8 -*- 

# Limit phone-home metrics to Apple and make macOS a little more private

# Use the hosts file to block known malware, advertising & unwanted domains
# Download reputable hosts file to /etc/hosts
curl "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | sudo tee -a /etc/hosts

# Flush your DNS cache 
sudo dscacheutil -flushcache

# Reload the /etc/hosts file
sudo killall -HUP mDNSResponder

# macOS's `mDNSResponder` (multicast DNS daemon) puts entries into your system log
# Uncomment to dump snapshot of cache entries to /var/log/system.log if you need to check 
# tail -f /private/var/log/system.log



# Turn off Spotlight entirely
# Spotlight uploads your search terms in real time to Apple’s remote servers
# https://support.apple.com/kb/PH18943?locale=en_US&viewlocale=en_US
# https://gist.github.com/maxfenton/c5a316f4254d27b18cf3
# This seems to prevent Alfred.app from searching your files 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# macOS Quarantine stores information about ALL downloaded files in sqlite
# db is stored in ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2
# http://www.zoharbabin.com/hey-mac-i-dont-appreciate-you-spying-on-me-hidden-downloads-log-in-os-x/
# Examine the file, use SQL to query the sqlite database file:
# echo 'SELECT datetime(LSQuarantineTimeStamp + 978307200, "unixepoch") as LSQuarantineTimeStamp, LSQuarantineAgentName, LSQuarantineOriginURLString, LSQuarantineDataURLString from LSQuarantineEvent;' | sqlite3 /Users/$USER/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2


# What is this "Bonjour" thing anyways...
# https://support.apple.com/kb/PH18702?locale=en_US
# https://raymii.org/s/snippets/OS_X_Turn_Bonjour_off_or_on_via_the_command_line.html
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES




# Disable autocorrect
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


# Ensure Microsoft isn't installing things without your knowledge.
defaults write com.microsoft.autoupdate2 HowToCheck Manual

# Remove the Auto-Hide Dock Delay
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Speed Up Mission Control Animations
defaults write com.apple.dock expose-animation-duration -float 0.12 && killall Dock

# Stop Full Names from Copying with Email Addresses in OS X Mail
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Enable Text Selection in Quick Look Windows
defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder

# Always Show the User Library Folder
chflags nohidden ~/Library/

# set highlight colour to green instead of blue
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"
# revert with below command
# defaults delete -g AppleHighlightColor

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true


# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true


# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false
