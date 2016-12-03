#!/usr/bin/env bash
# -*- coding: utf-8 -*- 

# Limit phone-home metrics to Apple and make macOS a little more private

# What is this "Bonjour" thing anyways...
# https://support.apple.com/kb/PH18702?locale=en_US
# https://raymii.org/s/snippets/OS_X_Turn_Bonjour_off_or_on_via_the_command_line.html
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

# Disable 2-finger swipe nav gestures in Chrome b/c it's just annoying
# http://osxdaily.com/2015/05/09/disable-swipe-navigation-google-chrome-mac/
defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE

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

# Turn macOS dashboard to speed things up / free up RAM & limit outside requests
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

# Turn off Spotlight entirely
# Spotlight uploads your search terms in real time to Apple’s remote servers
# https://support.apple.com/kb/PH18943?locale=en_US&viewlocale=en_US
# https://gist.github.com/maxfenton/c5a316f4254d27b18cf3
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# macOS Quarantine stores information about ALL downloaded files in sqlite
# db is stored in ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2
# http://www.zoharbabin.com/hey-mac-i-dont-appreciate-you-spying-on-me-hidden-downloads-log-in-os-x/
# Examine the file, use SQL to query the sqlite database file:
# echo 'SELECT datetime(LSQuarantineTimeStamp + 978307200, "unixepoch") as LSQuarantineTimeStamp, LSQuarantineAgentName, LSQuarantineOriginURLString, LSQuarantineDataURLString from LSQuarantineEvent;' | sqlite3 /Users/$USER/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2


