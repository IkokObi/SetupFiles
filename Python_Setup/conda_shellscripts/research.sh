#!/bin/sh -eu

env_name="research"
conda create --name ${env_name} python=3.7 -y
conda activate ${env_name}
conda install -c conda-forge jupyter_contrib_nbextensions -y
conda install \
	numpy\
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
	requests\
	-y

### conda だとnumpy import時に落ちる...
### pip だと補完が効かなくなる...
### 順番変えたら解決

# conda remove -n research --all
