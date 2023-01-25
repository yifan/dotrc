# take screenshots as jpg (usually smaller size) and not png
defaults write com.apple.screencapture type jpg
# do not open previous previewed files (e.g. PDFs) when opening a new one
defaults write com.apple.Preview ApplePersistenceIgnoreState YES
# show Library folder
chflags nohidden ~/Library
# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
# enable multi-finger drag
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# set screenshots directory
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location /Users/yifan/Screenshots
# show finder status and path bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
# set host name
sudo scutil --set HostName MagicalStaff
# restart finder
# killall Finder
