#!/bin/sh -eu

env_name="research"
conda create --name ${env_name} python=3.7 \
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
	-y
conda activate ${env_name}
# conda install -c conda-forge jupyter_contrib_nbextensions -y
### conda だとnumpy import時に落ちる...
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

# conda remove -n research --all
