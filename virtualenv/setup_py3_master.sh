
export PYENV_ROOT=${HOME}/.pyenv
export VENV_ROOT=${HOME}/.vpython

eval "$(pyenv init -)"
export PATH="/usr/local/opt/curl/bin:$PATH"
python_version=3.7.4
curdir=`pwd`

if [ ! -e ${VENV_ROOT}/${python_version}/master/bin/activate ]; then
    cd ${HOME}/.vpython
    mkdir -p ${VENV_ROOT}/${python_version}
    cd ${VENV_ROOT}/${python_version}
    pyenv local ${python_version}
    virtualenv master

fi

pyenv versions
source ${VENV_ROOT}/${python_version}/master/bin/activate

# Notebooks
pip install jupyter
pip install ipykernel
pip install ipython

# Visualization
pip install bokeh
pip install seaborn
pip install ggplot
pip install plotly
pip install pygal
pip install gleam
pip install geoplotlib
pip install leather


# ML
pip install numpy
pip install missingno
pip install pandas

# Web Services
pip install flask
pip install bottleneck


#Visual code
pip install autopep8
pip install pylint
pip install astroid
pip install isort
pip install lazy-object-proxy
pip install mccabe
pip install pycodestyle
pip install wrapt


#devops
pip install j2cli
pip install ansible

#AWS
pip install awscli
pip install boto3

#Security
pip install yaycl
pip install yaycl-crypt
pip install SSLyze
pip install cryptography
pip install nassl

#Testing
pip install locustio


#Dotfiles management
pip install dotfiles

# TMUX
pip install tmuxp

# deactivate after it is done
cd ${curdir}
deactivate
