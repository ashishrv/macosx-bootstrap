#!/bin/bash

SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$0

mkdir -p $HOME/.vpython/v2
mkdir -p $HOME/.vpython/v3


cur_dir=`pwd`
pyenv_global_version=`pyenv global`

setup_venv(){
	venv_name=$1
	venv_version=$2
	python_version=$3
	mkdir -p $HOME/.vpython/$venv_version
	if [ ! -e $HOME/.vpython/$venv_version/$venv_name/bin/activate ]; then
		pyenv local $python_version
		pyenv local
		venv_cmd=`pyenv which virtualenv`
		pip_cmd=`pyenv which pip`
		$pip_cmd install virtualenv
		echo "Using: $venv_cmd"
		echo "Creating virtual env: $venv_name at $HOME/.vpython/$venv_version/$venv_name"
		cd $HOME/.vpython/$venv_version
		$venv_cmd $venv_name
		cd $cur_dir
	else
		echo "Virtualenv: $venv_name: exists at $HOME/.vpython/$venv_version/$venv_name"
	fi
}

update_venv_packages(){
	venv_name=$1
	venv_version=$2
	if [ -e $HOME/.vpython/$venv_version/$venv_name/bin/activate ]; then
		echo "Updating packages for $HOME/.vpython/$venv_version/$venv_name"
		echo "Using file $SCRIPT_PATH/$venv_version/${venv_name}.txt"
		source $HOME/.vpython/$venv_version/$venv_name/bin/activate
		$HOME/.vpython/$venv_version/$venv_name/bin/pip install -r $SCRIPT_PATH/$venv_version/${venv_name}.txt
		deactivate
	else
		echo "Error: did not find the virtual env: $HOME/.vpython/$venv_version/$venv_name"
	fi
}

for line in `ls -1 ${SCRIPT_PATH}/v2/*.txt`
do
	file_basename=$(basename $line)
	venv_name="${file_basename%.*}"
	setup_venv $venv_name v2 2.7.14
	update_venv_packages $venv_name v2
	echo
	echo
	echo
done

for line in `ls -1 ${SCRIPT_PATH}/v3/*.txt`
do
	file_basename=$(basename $line)
	venv_name="${file_basename%.*}"
	setup_venv $venv_name v3 3.6.3
	update_venv_packages $venv_name v3
	echo
	echo
	echo
done

# Make sure that python global remains the same
# pyenv global $pyenv_global_version

