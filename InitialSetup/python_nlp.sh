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



# Install both pyenv and pyenv-virtualenv
if ! type pyenv > /dev/null 2>&1; then
	brew update
	brew install pyenv
	brew install pyenv-virtualenv
	echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
	echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
	source ~/.bash_profile
elif ! type pyenv-virtualenv > /dev/null 2>&1; then
	git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
	echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
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
# 最初のオプションはmatplotlibを使うため
# 	(参考URL) https://www.superharinezumi.com/entry/python-matplotlib
# TensorFlowがpython 3.7.0 に対応していない
Version='3.6.6'
if ! pyenv versions | grep ${Version} > /dev/null 2>&1; then
	PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install ${Version}
fi
envname='nlp'
dirname=".tempsetting_${envname}"
pyenv virtualenv ${Version} ${envname}
mkdir ${dirname}
cd ${dirname}
pyenv local ${envname}


# Install library
pip install --upgrade pip
for lib in `cat ./../python_${envname}_list.txt`; do
	pip install ${lib}
	echo "========================"
	echo "Installed ${lib}!"
	echo "========================"
done

# Install specific kernel
python -m ipykernel install --user --name ${envname} --display-name "Python (${envname})"


# delete temp directory
cd ..
rm -rf ${dirname}


