if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Zsh"
  return
fi

shell=(
  zsh
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

brew install "${shell[@]}"

grep "/usr/local/bin/zsh" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/zsh >> /private/etc/shells"
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
