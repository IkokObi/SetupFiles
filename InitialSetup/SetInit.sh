#!/bin/bash

# ========================
# Reference page
# --------------
# http://techblog.lclco.com/entry/2018/07/31/140000
#
# Install List
# ------------
# - Homebrew
# - vim
# - brew_list内のファイル
# - cask_list内のファイル
# - mas_list内のファイル
# ========================


# Homebrew
if ! type brew > /dev/null 2>&1; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew upgrade
	brew install caskroom/cask/brew-cask
	echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.bashrc
fi


# Install by Homebrew
for app in `cat brew_list.txt`; do
  if ! type ${app} > /dev/null 2>&1; then
    brew install ${app}
  else
    echo "Installed ${app}"
  fi
done

# オプション付きインストール
if ! type vim > /dev/null 2>&1; then
	brew Install vim --with-lua
fi


# Install by cask
while read line
do
	IFS=','
	set -- $line
	App_name=$1
	Install_name=$2
	if ! ls /Applications/ | grep ${App_name} > /dev/null 2>&1; then
		brew cask install ${Install_name}
	else
		echo "Installed ${App_name}"
	fi
done < ./cask_list.txt


# # Install by mas
while read line
do
	IFS=','
	set -- $line
	App_name=$1
	Install_num=$2
	if ! ls /Applications/ | grep ${App_name} > /dev/null 2>&1; then
		mas install ${Install_num}
	else
		echo "Installed ${App_name}"
	fi
done < ./mas_list.txt


