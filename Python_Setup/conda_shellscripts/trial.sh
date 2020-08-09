#!/bin/sh -eu

env_name="trial"
conda create --name ${env_name} python=3.7 -y
conda activate ${env_name}
conda install -c conda-forge jupyter_contrib_nbextensions -y
conda install numpy\
       	pandas\
       	matplotlib\
       	scipy\
       	jupyter\
	tqdm\
	scikit-learn\
	flake8\
	black\
	isort\
	xlrd\
	openpyxl\
	-y

### jupyter_contrib_nbextensions について
### conda だとnumpy import時に落ちる...
# pip install jupyter_contrib_nbextensions
# jupyter contrib nbextension install --user
### pip だと補完が効かなくなる...
### 順番変えたら解決

# conda remove -n trial --all
