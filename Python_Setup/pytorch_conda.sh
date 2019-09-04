#!/bin/bash -eu

env_name="pytorch"

conda create --name ${env_name} python=3.6\
       	numpy\
       	pandas\
       	matplotlib\
	seaborn\
       	scipy\
       	jupyter\
	pillow\
	tqdm\
	-y
conda activate ${env_name}
conda install -c conda-forge jupyter_contrib_nbextensions -y
conda install pytorch torchvision -c pytorch -y
conda install -c derickl torchtext -y

# conda remove -n pytorch --all
