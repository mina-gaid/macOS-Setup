# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

# Software list
casks=(
  brave-browser
  google-chrome
  microsoft-edge
  firefox
  spotify
  1password
  vlc
  handbrake
  sketchbook
  smallpdf
  teamviewer
  discord
  protonvpn
  slack
  github
  sequel-pro
  mysqlworkbench
  db-browser-for-sqlite
  mamp
  rstudio
  visual-studio-code
  pycharm
  datagrip
  goland
  intellij-idea
  webstorm
  phpstorm
  visual-studio
  docker
  java
  ibm-cloud-cli
  android-studio
)

# Tools list
brew=(
  python
  r
  mysql
  postgresql
  node
  git
  heroku/brew/heroku
  azure-cli
  yarn
)

# Python packages list
pip=(
  pipenv
  youtube-dl
  Pillow
  optimize-images
)

# Node packages list
npm=(
  @angular/cli@latest
  angular
  nativescript
  electron
  expo-cli
)

# Ruby packages list
gem=(
  sass
)

# VS Code extension list
vscode=(
  ms-dotnettools.csharp
  esbenp.prettier-vscode
  ms-python.python
  visualstudioexptteam.vscodeintellicode
  msjsdiag.vscode-react-native
)

brew tap caskroom/cask
brew tap caskroom/versions

echo "Installing apps..."
for i in "${casks[@]}"
do
   :
   brew cask install --appdir="/Applications" $i
done

echo "Installing Dev languages & packages..."
for i in "${brew[@]}"
do
   :
   brew install $i
done

echo "Installing Python packages & frameworks..."
for i in "${pip[@]}"
do
   :
   pip3 install $i
done

echo "Installing Ruby tools..."
for i in "${gem[@]}"
do
   :
   gem install $i
done

echo "Installing Node frameworks..."
for i in "${npm[@]}"
do
   :
   npm install -g $i
done

echo "Installing VS Code extensions..."
for i in "${vscode[@]}"
do
   :
   code --install-extension $i
done

echo "Installing XCode-stuff..."
xcode-select --install

# Git configuration
echo "Configuring Git..."
cp .zshenv ~/
cp .vimrc ~/
cp .gitignore_global ~/
cp .gitconfig ~/
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name "Mina Gaid"
git config --global user.email mina.gaid@ibm.com

# Cleanup
echo "Cleaning up..."
brew cleanup

rm -f -r /Library/Caches/Homebrew/*

echo "Done! Please Install other Apps, including IBM Apps manually"
