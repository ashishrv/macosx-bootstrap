SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$0

export PYENV_ROOT=${HOME}/.pyenv
export VENV_ROOT=${HOME}/.vpython

pybin=`which python`
py_bin_dir=$(dirname $pybin)

if [[ -f ${py_bin_dir}/activate ]]; then
    echo "This is a python virtual environment ..."
    echo "Updating pip packages for this environment ...."
    echo

    for filename in `ls ${SCRIPT_PATH}/requirements/*.txt`
    do
        echo ${filename}
        ${py_bin_dir}/pip install -r ${filename}
    done
    ${py_bin_dir}/pip freeze

else

    echo "This is not a python virtual environment ..."
    echo "Can only install packages to a python virtual enironment ...."

fi
