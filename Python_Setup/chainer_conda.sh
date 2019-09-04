#!/bin/bash -eu

env_name="chainer"
conda create --name ${env_name} python=3.7\
       	numpy\
       	pandas\
       	matplotlib\
       	scipy\
       	jupyter\
	tqdm\
	pillow\
	-y
conda activate ${env_name}
conda install -c conda-forge jupyter_contrib_nbextensions -y
pip install chainer

# conda remove -n test --all
