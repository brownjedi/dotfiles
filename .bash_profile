export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
eval $(/usr/libexec/path_helper -s)

# Python from pyenv
if which pyenv > /dev/null; then
	eval "$(pyenv init -)";
	pyenv virtualenvwrapper_lazy
fi
