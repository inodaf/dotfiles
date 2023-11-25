all: brew brew-packages gitconfig ohmyzsh zshrc cask-apps macos

gitconfig:
  cp .gitconfig ~/.gitconfig

zshrc:
  cp .zshrc ~/.zshrc
  cp .zprofile ~/.zprofile

ohmyzsh:
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew:
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | zsh

brew-packages: brew
	brew bundle --file=Brewfile || true

cask-apps: brew
	brew bundle --file=Caskfile || true

macos:
  ./macos/defaults.sh
  ./macos/dock.sh
