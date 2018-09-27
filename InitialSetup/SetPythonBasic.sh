#!/bin/bash

# ========================
# Install List
# ------------
# - pyenv
# - pyenv-virtualenv
# - python3.7.0
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
# 最初のオプションはmatplotlibを使うため
# 	(参考URL) https://www.superharinezumi.com/entry/python-matplotlib
PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.7.0
pyenv virtualenv 3.7.0 basic
mkdir ./.tempsetting
cd ./.tempsetting
pyenv local basic

pip install --upgrade pip
pip install ipython==6.5.0
pip install jupyter
python -m ipykernel install --user --name basic --display-name "Python (Basic)"

# install library
for lib in `cat ./../python_basic_list.txt`; do
	pip install ${lib}
	echo "========================"
	echo "Installed ${lib}!"
	echo "========================"
done

# delete temp directory
cd ..
rm -rf .tempsetting

