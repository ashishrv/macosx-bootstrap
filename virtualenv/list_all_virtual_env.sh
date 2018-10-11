#!/bin/bash

SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$0

for line in `ls -d -1 ${HOME}/.vpython/*`
do
	echo "Collecting virtual env from: $line"
	virtual_env_name=$(basename $line)
	echo "Collecting pip packages for: $virtual_env_name"
	source $line/bin/activate
	pip freeze > ${SCRIPT_PATH}/${virtual_env_name}.txt
	deactivate
done

