#! /bin/sh

black='\033[0;30m'
blue='\033[0;34m'
green='\033[0;32m'
cyan='\033[0;36m'
red='\033[0;31m'br
purple='\033[0;35m'
brown='\033[0;33m'
gray='\033[0;37m'
dark_gray='\033[1;30m'
light_blue='\033[1;34m'
light_green='\033[1;32m'
light_cyan='\033[1;36m'
light_red='\033[1;31m'n
light_purple='\033[1;35m'
yellow='\033[1;33m'
white='\033[1;37m'

alias Reset="tput sgr0"      #  Reset text attributes to normal
                             #+ without clearing screen.

# Color-echo.
# Argument $1 = messageu
# Argument $2 = Colortt
cecho() {
    echo "${2}${1}"
    Reset # Reset to normal.
    return
}

echo ""
cecho "===================================================" $dark_gray
cecho "Install homebrew? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew update
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install brew utilities? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    binaries=(
      ansible
      hugo
      ngrep
      youtube-dl
      icdiff
      nmap
      zsh
      git
      mackup
      tcptrace
      git-flow
      mobile-shell
      tmux
      moreutils
      homebrew/php/composer
      homebrew/dupes/grep 
      mtr
      php-cs-fixer
      coreutils
      htop-osx
      watch
      findutils
      httpie
      ncftp
      rsync
      wget
      httrack
      netcat
      TomAnthony/brews/itermocil
      vim
    )

    echo ""
    echo "Installing sudolikeaboss"
    brew tap ravenac95/sudolikeaboss
    brew install sudolikeaboss

    echo ""
    echo "Installing php stuff"
    brew install php56

    echo ""
    echo "Installing brew packages"
    brew install ${binaries[@]}
    brew cleanup

    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install oh-my-zsh? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing oh-my-zsh"
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    break;;

  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install spf13-vim? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing spf13-vim"
    curl http://j.mp/spf13-vim3 -L -o - | sh
    break;;

  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install brew cask and apps? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing cask and tapping" $gray
    brew install caskroom/cask/brew-cask
    brew tap popcorn-time/homebrew-cask https://git.popcorntime.io/caskroom/homebrew-cask.git
    brew tap caskroom/versions

    echo ""
    echo "Installing brew-cask apps"
    apps=(
      0xed
      1password
      adobe-reader
      adium
      alfred
      anvil
      appcleaner
      betterzip
      bittorrent-sync
      boxer
      caffeine
      cocoarestclient
      coconutbattery
      colloquy
      comicbooklover
      cyberduck
      deezer
      disk-inventory-x
      dropbox
      electric-sheep
      evernote
      feeds
      filebot
      firefox
      firefoxdeveloperedition
      github-desktop
      gog-galaxy
      google-chrome
      google-drive
      google-earth
      google-hangouts
      google-photos-backup
      gpgtools
      hipchat
      imageoptim
      iterm2
      kdiff3
      keepassx
      kitematic
      lastfm
      libreoffice
      macgdbp
      macvim
      music-manager
      musicbrainz-picard
      notational-velocity
      panic-unison
      phpstorm
      picasa
      plex-home-theater
      qlimagesize
      qlprettypatch
      qlstephen
      popcorn-time
      quicklook-csv
      quicklook-json
      seashore
      sequel-pro
      sitesucker
      skitch
      skype
      slack
      sourcetree
      sqlitebrowser
      sublime-text
      suspicious-package
      telegram
      the-unarchiver
      thunderbird
      toggldesktop
      torbrowser
      transmission
      vagrant
      virtualbox
      viscosity
      vlc
      vmware-fusion
      webpquicklook
      wercker
      wercker-cli
      wireshark
    )

    brew cask install ${apps[@]}
    brew cask cleanup
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install node and npm? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing node (without npm)" $gray
    # For more info, see here https://gist.github.com/DanHerbert/9520689
    brew install node --without-npm

    echo ""
    cecho "Installing nvm to manage node" $gray
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

    brew cask cleanup
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install fonts? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing brew-cask fonts"
    brew tap caskroom/fonts
    fonts=(
      font-comic-neue
      font-droid-sans
      font-droid-sans-mono
      font-meslo-lg
      font-open-sans
      font-open-sans-condensed
      font-roboto
      font-source-code-pro
    )

    brew cask install ${fonts[@]}
    brew cask cleanup

    echo ""
    echo "Installing all Google Web Fonts"
    curl https://raw.githubusercontent.com/qrpike/Web-Font-Load/master/install.sh | sh

    echo ""
    echo "Downloading and installing Powerline fonts"
    wget https://github.com/powerline/fonts/archive/master.zip -O fonts.zip && unzip fonts.zip
    ./fonts-master/install.sh
    rm -r fonts.zip && rm -r fonts-master
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Remember to download the OSX for Hackers script:" $gray
cecho "https://gist.github.com/brandonb927/3195465" $gray
cecho "===================================================" $dark_gray
