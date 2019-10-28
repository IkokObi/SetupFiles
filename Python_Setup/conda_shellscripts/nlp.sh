#!/bin/bash -eu

env_name="nlp"
conda create --name ${env_name} python=3.7\
       	numpy\
       	pandas\
       	matplotlib\
       	scipy\
       	jupyter\
	scikit-learn\
	numba\
	tqdm\
	pillow\
	xlrd\
	flake8\
	openpyxl\
	black\
	isort\
	-y
conda activate ${env_name}
conda install -c conda-forge jupyter_contrib_nbextensions -y
conda install -c conda-forge hdbscan -y
conda install -c conda-forge xgboost -y
conda install -c conda-forge lightgbm -y
conda install pytorch torchvision -c pytorch -y
conda install -c pytorch torchtext -y 
conda install -c conda-forge tensorflow -y
pip install\
	chainer\
       	mojimoji\
       	mecab-python3\
       	umap-learn\
	pyknp\
	gensim\
	sentencepiece\
	SudachiPy
pip install https://object-storage.tyo2.conoha.io/v1/nc_2520839e1f9641b08211a5c85243124a/sudachi/SudachiDict_core-20190927.tar.gz

# conda remove -n nlp --all
