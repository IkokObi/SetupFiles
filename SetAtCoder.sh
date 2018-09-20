#!/bin/bash

# ==================================
# How To Execute
# --------------
# $ bash SetAtCoder.sh
# 
# Requirements
# ------------
# Below plugins should be installed
# 	pyenv
# 	pyenv-virtualenv
# ==================================


# install python version 3.4.3
pyenv install 3.4.3
pyenv virtualenv 3.4.3 atcoder
pyenv local atcoder

# install library
pip install numpy scipy scikit-learn

