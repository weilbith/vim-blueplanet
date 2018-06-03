# Create folder where to clone possible tools into.
CLONE_DIR="~/Tools/vim"
mkdir -pf $CLONE_DIR

# Install NPX for NPM to execute packages installed globally.
sudo npm install --global npx

# Rip Grep for Ferret
cd /tmp
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
dpkg -i ripgrep_0.8.1_amd64.deb

# Linter/Formatter
## Vint
pip install --user vim-vint

## Uncrustify
cd ~/Tools
git clone https://github.com/uncrustify/uncrustify.git
mkdir uncrustify/build
cd uncrustify/build
cmake ..
make
sudo make install

## Prettier
sudo npm install --global prettier

## Solium
sudo npm install --global solium

## FixJSON
sudo npm install --global fixjson
