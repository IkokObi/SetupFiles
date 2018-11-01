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
# - brew_list.txt内のファイル
# - cask_list.txt内のファイル
# - mas_list.txt内のファイル
# ========================


# Homebrew
if ! type brew > /dev/null 2>&1; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew upgrade
	brew install caskroom/cask/brew-cask
	echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.bashrc
fi


# Install app in "brew_list.txt" by Homebrew
for app in `cat brew_list.txt`; do
  if ! type ${app} > /dev/null 2>&1; then
    brew install ${app}
  else
    echo "Installed ${app}"
  fi
done

# オプション付きインストール
if vim --version | grep -lua > /dev/null 2>&1; then
	brew uninstall vim
	brew Install vim --with-lua
fi


# Install app in "cask_list.txt" by cask
while read line
do
	App_name=`echo ${line} | cut -d"," -f1`
	Install_name=`echo ${line} | cut -d"," -f2`
	if ! ls /Applications/ | grep "${App_name}" > /dev/null 2>&1; then
		brew cask install ${Install_name}
	else
		echo "Installed ${App_name}"
	fi
done < ./cask_list.txt


# # Install app in "mas_list.txt" by mas
while read line
do
	App_name=`echo ${line} | cut -d"," -f1`
	Install_name=`echo ${line} | cut -d"," -f2`
	if ! ls /Applications/ | grep "${App_name}" > /dev/null 2>&1; then
		mas install ${Install_num}
	else
		echo "Installed ${App_name}"
	fi
done < ./mas_list.txt

