
export PYENV_ROOT=${HOME}/.pyenv
eval "$(pyenv init -)"
export PATH="/usr/local/opt/curl/bin:$PATH"
python_version=3.7.4
curdir=`pwd`

if [ !-e ${PYENV_ROOT}/${python_version}/master/bin/activate ]; then
    cd ${HOME}/.vpython
    mkdir -p ${PYENV_ROOT}/${python_version}
    cd ${PYENV_ROOT}/${python_version}
    pyenv local ${python_version}
    virtualenv master

fi

source ${PYENV_ROOT}/${python_version}/master/bin/activate

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


# deactivate after it is done
cd ${curdir}
deactivate