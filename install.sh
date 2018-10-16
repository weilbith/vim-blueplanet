PRJ_ROOT=$HOME/Tools/vim-blueplanet
NVIM_ROOT=$HOME/.config/nvim
DATA_DIR=$HOME/.vim
FILES_DIR=$DATA_DIR/files

# Get the project
mkdir -p $PRJ_ROOT
# TODO: Token!
#git clone https://github.com/weilbith/vim-blueplanet.vim $PRJ_ROOT

[[ -d "$NVIM_ROOT" ]] && mv $NVIM_ROOT $NVIM_ROOT.bkp
ln -sf $PRJ_ROOT $NVIM_ROOT

mkdir -p $DATA_DIR/session
mkdir -p $DATA_DIR/spell
mkdir -p $DATA_DIR/tags
mkdir -p $FILES_DIR/backup
mkdir -p $FILES_DIR/undo
mkdir -p $FILES_DIR/info


# Install package manager Dein.vim
INSTALL_FILE=installer.sh
DEIN_DIR=$HOME/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $INSTALLER_FILE
bash $INSTALLER_FILE $DEIN_DIR
rm $INSTALLER_FILE

# Install NPX to execute NodeJS packages installed globally.
yarn global add npx

# Improved CTags for vim-gutentags
trizen -S universal-ctags-git

# Interface for Python to NVim
pip install --user neovim
