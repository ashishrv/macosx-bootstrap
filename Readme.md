# Setup Mac

## Bootstrap

```bash
mkdir -p ${HOME}/temp
cd ${HOME}/temp
curl -LOk https://github.com/ashishrv/macosx-bootstrap/archive/master.zip
unzip master.zip
sh ${HOME}/temp/macosx-bootstrap-master/bootstrap.sh
```

## Brew

### packages

```bash
sh ${HOME}/temp/macosx-bootstrap-master/brew/install-brew-packages.sh
```

### Cask packages

```bash
sh ${HOME}/temp/macosx-bootstrap-master/brew/install-cask-packages.sh
```

## Others

### Setup dropbox
### Setup 1Password
### Setup KeepassXc
