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
	-y

# conda remove -n nlp --all
