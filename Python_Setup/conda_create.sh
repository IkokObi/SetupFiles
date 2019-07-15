#!/bin/bash -eu

env_name="test"
conda create --name ${env_name} python=3.7\
       	numpy\
       	pandas\
       	matplotlib\
       	scipy\
       	jupyter\
	-y
conda activate ${env_name}
conda install -c conda-forge jupyter_contrib_nbextensions -y

# conda remove -n test --all
