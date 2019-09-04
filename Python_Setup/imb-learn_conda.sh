#!/bin/bash -eu

env_name="imb-learn"

conda create --name ${env_name} python=3.6\
       	numpy\
       	pandas\
       	matplotlib\
       	scipy\
       	jupyter\
	-y
conda activate ${env_name}
conda install -c conda-forge imbalanced-learn -y
conda install -c conda-forge jupyter_contrib_nbextensions -y
conda install -c anaconda pillow -y
conda install -c anaconda seaborn -y
conda install -c conda-forge keras -y

# conda remove -n imb-learn --all
