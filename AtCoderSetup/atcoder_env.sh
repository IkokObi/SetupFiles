#!/bin/bash

# ==================================
# How To Execute
# --------------
# $ bash atcoder_env.sh
# 
# Requirements
# ------------
# Below plugins should be installed
# 	pyenv
# 	pyenv-virtualenv
#
# Installation List
# -----------------
# atcoder_env_list.txt
# ==================================


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

