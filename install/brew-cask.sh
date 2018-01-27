if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

echo "Tapping casks..."

brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/drivers

# Install packages

apps=(
  alfred
  appcleaner
  bartender
  beardedspice
  betterzip
  cheatsheet
  cyberduck
  dash
  dropbox
  endurance
  eve
  firefox
  flash-player
  flux
  gitkraken
  glimmerblocker
  google-chrome
  google-chrome-canary
  hammerspoon
  iterm2
  jadengeller-helium
  karabiner-elements
  kaleidoscope
  logitech-gaming-software
  logitech-options
  logitech-unifying
  macdown
  opera
  screenflow
  sequel-pro
  silverlight
  slack
  spectacle
  spotify
  sublime-text
  transmission
  transmit
  virtualbox
  visual-studio-code
  vlc
)

fonts=(
  font-droidsansmono-nerd-font-mono
  font-fira-code
  font-fira-mono
  font-firacode-nerd-font-mono
  font-firamono-nerd-font-mono
  font-fira-sans
  font-hack
  font-hack-nerd-font
  font-hack-nerd-font-mono
  font-inconsolata-g-for-powerline
  font-input
  font-lato
  font-lora
  font-merriweather
  font-monserrat
  font-noto-sans
  font-noto-sans-mono
  font-office-code-pro
  font-open-sans
  font-open-sans-condensed
  font-pt-sans
  font-raleway
  font-roboto
  font-roboto-condensed
  font-roboto-mono-nerd-font-mono
  font-roboto-slab
  font-source-code-pro
  font-source-code-pro-for-powerline
  font-source-sans-pro
  font-source-serif-pro
  font-ubuntu-nerd-font
  font-ubuntu-nerd-font-mono
  font-ubuntumono-nerd-font
  font-ubuntumono-nerd-font-mono
)

echo "installing apps..."
brew cask install "${apps[@]}"

echo "installing fonts..."
brew cask install "${fonts[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
