#!/bin/bash

# ========================
# Install List
# ------------
# - python3.6.6
# - MeCab
# - JUMAN++
# - JUMAN
#	- pyknpがJUMANに依存していた(ver 0.3で)
# - KNP
# - packages in python_nlp_list.txt 
# ========================



# Install both pyenv and pyenv-virtualenv
if ! type pyenv > /dev/null 2>&1; then
	brew update
	brew install pyenv
	brew install pyenv-virtualenv
	echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
	echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
	source ~/.bash_profile
elif ! type pyenv-virtualenv > /dev/null 2>&1; then
	git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
	echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
	source ~/.bash_profile
fi


# Install specified version of python
# TensorFlowがpython 3.7.0 に対応していない
Version='3.6.6'
if ! pyenv versions | grep ${Version} > /dev/null 2>&1; then
	pyenv install ${Version}
fi
envname='research'
dirname=".tempsetting_${envname}"
pyenv virtualenv ${Version} ${envname}
mkdir ${dirname}
cd ${dirname}
pyenv local ${envname}


# Install library
pip install --upgrade pip
for lib in `cat ./../python_${envname}_list.txt`; do
	pip install ${lib}
	echo "========================"
	echo "Installed ${lib}!"
	echo "========================"
done

# Install specific kernel
python -m ipykernel install --user --name ${envname} --display-name "Python (${envname})"

# matplotlib setting
mpl_path=$(python -c "import matplotlib;print(matplotlib.matplotlib_fname())")
sed -i -e "/^backend/s/macosx/Tkagg/" ${mpl_path}

# delete temp directory
cd ..
rm -rf ${dirname}


