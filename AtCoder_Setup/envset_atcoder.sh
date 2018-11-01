#!/bin/bash

# ==================================
# How To Execute
# --------------
# $ . atcoder_env.sh
# or
# $ source atcoder_env.sh
# 
# Requirements
# ------------
# Below plugins should be installed
# 	pyenv
# 	pyenv-virtualenv
#
# Installation List
# -----------------
# atcoder.txt
# ==================================


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


# Load install list
List=(`cat atcoder_env_list.txt | xargs`)

# Python version
Version=`echo ${List[0]} | cut -d":" -f2`

# Install python version 3.4.3
pyenv install ${Version}
pyenv virtualenv ${Version} atcoder
dirname=".tempsetting_atcoder"
mkdir ${dirname}
cd ${dirname}
pyenv local atcoder

pip install jupyter==1.0.0
pip install ipython==6.5.0
# Comment : ipykernel is installed during jupyter installation
python -m ipykernel install --user --name atcoder --display-name "Python (AtCoder)"

# Install library
for i in `seq $((${#List[@]}-1))`
do
	pip install ${List[i]}
done

# Delete temp directory
cd ..
rm -rf ${dirname}

