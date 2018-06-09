# Create folder where to clone possible tools into.
CLONE_DIR="~/Tools/vim"
mkdir -pf $CLONE_DIR

# Install NPX for NPM to execute packages installed globally.
sudo npm install --global npx

# Rip Grep for Ferret
cd /tmp
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
dpkg -i ripgrep_0.8.1_amd64.deb

# Use lists for packages to install them at once at the end.
YARN_LIST=""
PIP_LIST=""

# Linter/Formatter
## Vint
PIP_LIST=$PIP_LIST + " vim-vint"

## Uncrustify
cd ~/Tools
git clone https://github.com/uncrustify/uncrustify.git
mkdir uncrustify/build
cd uncrustify/build
cmake ..
make
sudo make install

## Prettier
YARN_LIST=$YARN_LIST + " prettier"

## Solium
YARN_LIST=$YARN_LIST + " solium"

## FixJSON
YARN_LIST=$YARN_LIST + " fixjson"

## ESLint
YARN_LIST=$YARN_LIST + " eslint eslint-plugin-import bable-eslint"



# Install package lists.
yarn global add $YARN_LIST
pip install --user $PIP_LIST
