# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

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
  resharper
  intellij-idea
  webstorm
  phpstorm
  visual-studio
  docker
  java
  ibm-cloud-cli
)

brew=(
  python
  r
  mysql
  postgresql
  node
  git
  heroku/brew/heroku
  azure-cli
)

pip=(
  django
  pipenv
  youtube-dl
  whitenoise
  Pillow
  optimize-images
)

npm=(
  @angular/cli@latest
  angular
  nativescript
  electron
)

fonts=(
    font-roboto
    font-sanfrancisco
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
   pip install $i
done

echo "Installing Node frameworks..."
for i in "${npm[@]}"
do
   :
   npm install -g $i
done

echo "Installing fonts..."
brew tap caskroom/fonts
for i in "${fonts[@]}"
do
   :
   brew cask install $i
done

echo "Installing XCode-stuff..."
xcode-select --install

# Git configuration
echo "Configuring Git..."
cp .bash_profile ~/
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
