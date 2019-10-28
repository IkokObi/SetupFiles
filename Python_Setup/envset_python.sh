#!/bin/bash

# ========================
# Install List
# ------------
# - anaconda3-5.2.0
# - packages in python.txt 
# ========================
Version=anaconda3-5.2.0


# Install both pyenv
if ! type pyenv > /dev/null 2>&1; then
	brew update
	brew install pyenv
	echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
	source ~/.bash_profile
fi



# Install specified version of python
# TensorFlowがpython 3.7.0 に対応していない
if ! pyenv versions | grep ${Version} > /dev/null 2>&1; then
	pyenv install ${Version}
fi
dirname=".tempsetting"
mkdir ${dirname}
cd ${dirname}
pyenv local ${Version}


# Install library with pip
echo "===== Installation with pip started ====="
pip install --upgrade pip
for lib in `cat ./../packages/pip.txt`; do
	if [ ${lib:0:1} != "#" ]; then
		pip install ${lib}
		echo "========================"
		echo "Installed ${lib}!"
		echo "========================"
	fi
done

# Install library with conda
echo "===== Installation with conda started ====="
for lib in `cat ./../packages/conda.txt`; do
	if [ ${lib:0:1} != "#" ]; then
		conda install -c conda-forge ${lib}
		echo "========================"
		echo "Installed ${lib}!"
		echo "========================"
	fi
done

# delete temp directory
cd ..
rm -rf ${dirname}

