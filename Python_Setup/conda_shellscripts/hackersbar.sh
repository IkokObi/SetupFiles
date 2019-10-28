#!/bin/bash -eu

env_name="hackersbar"
conda create --name ${env_name} python=3.7\
       	numpy\
       	pandas\
       	matplotlib\
       	scipy\
       	jupyter\
	tqdm\
	pillow\
	scikit-learn\
	-y
conda activate ${env_name}
conda install -c conda-forge jupyter_contrib_nbextensions -y
pip install chainer
conda install pytorch torchvision -c pytorch -y
conda install -c derickl torchtext -y
conda install -c conda-forge tensorflow -y

# conda remove -n hackersbar --all
