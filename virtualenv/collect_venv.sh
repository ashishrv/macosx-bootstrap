#!/bin/bash

SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$0

for line in `ls -d -1 ${HOME}/.vpython/*/*`
do
	echo "Collecting virtual env from: $line"
	virtual_env_name=$(basename $line)
	echo "Collecting pip packages for: $virtual_env_name"
	source $line/bin/activate
	mkdir -p  ${SCRIPT_PATH}/pip_packages/${virtual_env_name}
	echo $line > ${SCRIPT_PATH}/pip_packages/${virtual_env_name}/path.txt
	pip freeze > ${SCRIPT_PATH}/pip_packages/${virtual_env_name}/packages.txt
	deactivate
done
