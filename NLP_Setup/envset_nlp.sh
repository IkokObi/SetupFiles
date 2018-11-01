#!/bin/bash

# ========================
# Install List
# ------------
# - MeCab
# - JUMAN++
# - JUMAN
#	- pyknpがJUMANに依存していた(ver 0.3で)
#	- pyknpは別途Python_Setup等でインストール済みとする
# - KNP
#
# Requirements
# ------------
# Homebrew, git は使えることを想定
# ========================


# MeCab
if ! type mecab > /dev/null 2>&1; then
	curdir=$(pwd)
	cd ~/Downloads
	brew install mecab
	brew install mecab-ipadic
	brew install xz
	git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
	cd mecab-ipadic-neologd
	# yes | ./bin/install-mecab-ipadic-neologd -n -a
	./bin/install-mecab-ipadic-neologd -n -a # 途中でyesの入力が求められるはず
	cd ${curdir}
fi


# JUMAN++
if ! type jumanpp > /dev/null 2>&1; then
	brew install jumanpp
fi


# JUMAN
if ! type juman > /dev/null 2>&1; then
	brew install juman
fi


# KNP
if ! type knp > /dev/null 2>&1; then
	brew tap uetchy/nlp
	brew install knp
fi

