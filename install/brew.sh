if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery
brew tap homebrew/php
brew update
brew upgrade

# Install packages

apps=(
  bash-completion2
  bats
  battery
  coreutils
  dark-mode
  diff-so-fancy
  dockutil
  exa
  ffmpeg
  fasd
  findutils
  get-flash-videos
  gifsicle
  git
  git-extras
  gnu-sed --with-default-names
  graphicsmagick
  grep --with-default-names
  highlight
  hub
  httpie
  imagemagick
  jq
  lynx
  # mackup
  mariadb
  nano
  pandoc
  peco
  php71 # from homebrew/php
  pre-commit
  psgrep
  python
  shellcheck
  ssh-copy-id
  tidy-html5
  trash
  tree
  unar
  webkit2png
  wget
  wifi-password
  wp-cli # from homebrew/php
  yarn
)

brew install "${apps[@]}"

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
