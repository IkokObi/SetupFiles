#!/bin/bash

# ========================
# Install List
# ------------
# - pyenv
# - pyenv-virtualenv
# - python3.6.6
# - packages in python_basic_list.txt 
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
Version='3.6.6'
if ! pyenv versions | grep ${Version} > /dev/null 2>&1; then
	pyenv install ${Version}
fi
envname='basic'
dirname=".tempsetting_${envname}"
pyenv virtualenv ${Version} ${envname}
mkdir ${dirname}
cd ${dirname}
pyenv local ${envname}


# install library
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

