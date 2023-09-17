# Check for Homebrew,
# Install if we don't have it
if [[ $(command -v brew) == "" ]]; then
  echo "Installing Hombrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Updating Homebrew"
  brew update
fi

# Software list
casks=(
  microsoft-edge
  brave-browser
  spotify
  protonvpn
  discord
  slack
  zoom
  microsoft-teams
  github
  visual-studio-code
  intellij-idea
  docker
  postman
  android-studio
  background-music
  kap
)

# Tools list
brew=(
  git
  python
  node
  yarn
  postgresql
  azure-cli
  awscli
  cloudfoundry/tap/cf-cli@7
  heroku/brew/heroku
  openshift-cli
  youtube-dl
  watchman
  svn
  bleunlock
)

# Python packages list
pip=(
  pipenv
  Pillow
  optimize-images
)

# Node packages list
npm=(
  create-react-app
  create-react-native-app
  expo-cli
  n
)

# Ruby packages list
gem=(
  sass
)

# VS-Code extension list
vscode=(
  ms-python.python
  msjsdiag.vscode-react-native
  ms-vscode.vscode-typescript-next
  ms-dotnettools.csharp
  esbenp.prettier-vscode
  visualstudioexptteam.vscodeintellicode
)

# Fonts list
fonts=(
  font-roboto
  font-roboto-mono
  font-sf-pro
  font-sf-compact
  font-sf-mono
  font-new-york
)

# Initiate Homebrew casks
brew tap 'homebrew/cask'
brew tap 'homebrew/cask-fonts'

# Installing Software list
echo "Installing apps..."
for i in "${casks[@]}"
do
   :
   brew install --cask --appdir="/Applications" $i
done

# Installing Tools list
echo "Installing Dev languages & packages..."
for i in "${brew[@]}"
do
   :
   brew install $i
done

# Installing Python packages list
echo "Installing Python packages & frameworks..."
for i in "${pip[@]}"
do
   :
   pip3 install $i
done

# Installing Ruby packages list
echo "Installing Ruby tools..."
for i in "${gem[@]}"
do
   :
   gem install $i
done

# Installing Node packages list
echo "Installing Node frameworks..."
for i in "${npm[@]}"
do
   :
   npm install -g $i
done

# Installing VS-Code extension list
echo "Installing VS Code extensions..."
for i in "${vscode[@]}"
do
   :
   code --install-extension $i
done

# Installing fonts
echo "Installing fonts..."
for i in "${fonts[@]}"
do
   :
   brew install --cask $i
done

# Setting-up XCode
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
git config --global user.email "mina.gaid@workday.com"
git config --global credential.helper osxkeychain
git config --global pull.rebase false

# Cleanup
echo "Cleaning up..."
brew cleanup
rm -f -r /Library/Caches/Homebrew/*

echo "Done! Please install other apps, including work related apps & tools manually"
