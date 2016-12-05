#!/usr/bin/env bash
# -*- coding: utf-8 -*- 

# Disable 2-finger swipe nav gestures in Chrome b/c it's just annoying
# http://osxdaily.com/2015/05/09/disable-swipe-navigation-google-chrome-mac/
defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool false

# Turn macOS dashboard to speed things up / free up RAM & limit outside requests
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

# Display the full path to the Finder window you are viewing
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder

# Use column view in all Finder windows by default
# http://www.defaults-write.com/change-default-view-style-in-os-x-finder/
defaults write com.apple.finder FXPreferredViewStyle Clmv

# always display scrollbars in Finder windows
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Prevent macOS from automatically saving files to iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Don't send search queries to Apple
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

killall Finder

killall Dock
