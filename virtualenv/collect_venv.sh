#!/bin/bash

SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$0

for linedir in `ls -d -1 ${HOME}/.vpython/*`
do
	virtual_env_dir_name=$(basename $linedir)
	mkdir -p  ${SCRIPT_PATH}/pip_packages/${virtual_env_dir_name}
	echo "Checking virtualenv under directory: ${virtual_env_dir_name}"
	for line in `ls -d -1 ${HOME}/.vpython/${virtual_env_dir_name}/*`
	do
		virtual_env_name=$(basename $line)
		mkdir -p  ${SCRIPT_PATH}/pip_packages/${virtual_env_dir_name}/${virtual_env_name}
		echo "Collecting packages for ${virtual_env_dir_name}/${virtual_env_name}"
		source ${HOME}/.vpython/${virtual_env_dir_name}/${virtual_env_name}/bin/activate
		echo "${HOME}/.vpython/${virtual_env_dir_name}/${virtual_env_name}" > ${SCRIPT_PATH}/pip_packages/${virtual_env_dir_name}/${virtual_env_name}/path.txt
		pip freeze > ${SCRIPT_PATH}/pip_packages/${virtual_env_dir_name}/${virtual_env_name}/packages.txt
		deactivate

	done
done
