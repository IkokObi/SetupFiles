#!/bin/bash -eu

env_name="3-7-4"
conda create --name ${env_name} python=3.7.4\
       	jupyter\
	-y
conda activate ${env_name}
pip install pipenv
conda install -c conda-forge jupyter_contrib_nbextensions -y

# conda remove -n 3-7-4 --all
