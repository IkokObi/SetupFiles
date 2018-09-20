#!/bin/bash

# ==================
# HOW TO EXECUTE
# $ bash SetAtCoder.sh
# ==================

# pyenv and pyenv-virtualenv should be installed
pyenv install 3.4.3
pyenv virtualenv 3.4.3 atcoder
pyenv local atcoder

# install library
pip install numpy scipy scikit-learn


