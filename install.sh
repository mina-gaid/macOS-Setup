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
  firefox
  spotify
  deezer
  1password
  vlc
  handbrake
  sketchbook
  smallpdf
  weka
  teamviewer
  discord
  protonvpn
  slack
  zoomus
  github
  anaconda
  sequel-pro
  mysqlworkbench
  db-browser-for-sqlite
  mamp
  rstudio
  atom
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
)

brew=(
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
  django-allauth
  virtualenv
  youtube-dl
  gunicorn
  psycopg2
  whitenoise
  Pillow
)

npm=(
  @angular/cli@latest
  angular
  nativescript
  electron-download
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

# CLI Tools
echo "Installing IBM Cloud CLI..."
curl -fsSL https://clis.ng.bluemix.net/install/osx | sh

echo "Installing xcode-stuff..."
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
