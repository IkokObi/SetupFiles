#!/bin/bash -eu

env_name="normal"
conda create --name ${env_name} python=3.7\
       	numpy\
       	pandas\
       	matplotlib\
       	scipy\
       	jupyter\
	tqdm\
	pillow\
	scikit-learn\
	flake8\
	xlrd\
	openpyxl\
	black\
	isort\
	-y
conda activate ${env_name}
conda install -c conda-forge jupyter_contrib_nbextensions -y
pip install chainer
conda install pytorch torchvision -c pytorch -y
conda install -c derickl torchtext -y
conda install -c conda-forge tensorflow -y
conda install -c conda-forge hdbscan -y
conda install -c conda-forge xgboost -y
conda install -c conda-forge lightgbm -y

# conda remove -n normal --all
