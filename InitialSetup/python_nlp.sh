#!/bin/bash

# ========================
# Install List
# ------------
# - python3.6.6
# - MeCab
# - JUMAN++
# - JUMAN
#	- pyknpがJUMANに依存していた(ver 0.3で)
# - KNP
# - packages in python_nlp_list.txt 
# ========================
Version='anaconda3-5.2.0'



# Install both pyenv and pyenv-virtualenv
if ! type pyenv > /dev/null 2>&1; then
	brew update
	brew install pyenv
	echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
	source ~/.bash_profile
fi


# MeCab
if ! type mecab > /dev/null 2>&1; then
	curdir=$(pwd)
	cd ~/Downloads
	brew install mecab
	brew install mecab-ipadic
	brew install xz
	git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
	cd mecab-ipadic-neologd
	# yes yes | ./bin/install-mecab-ipadic-neologd -n -a
	./bin/install-mecab-ipadic-neologd -n -a
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


# Install specified version of python
# TensorFlowがpython 3.7.0 に対応していない
if ! pyenv versions | grep ${Version} > /dev/null 2>&1; then
	pyenv install ${Version}
fi
envname='nlp'
dirname=".tempsetting_${envname}"
mkdir ${dirname}
cd ${dirname}
pyenv local ${Version}


# Install library
pip install --upgrade pip
for lib in `cat ./../python_${envname}_list.txt`; do
	pip install ${lib}
	echo "========================"
	echo "Installed ${lib}!"
	echo "========================"
done


# delete temp directory
cd ..
rm -rf ${dirname}


