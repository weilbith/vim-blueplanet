# Create folder where to clone possible tools into.
CLONE_DIR="~/Tools/vim"
mkdir -pf $CLONE_DIR

# Rip Grep for Ferret
cd /tmp
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
dpkg -i ripgrep_0.8.1_amd64.deb

# Linter/Formatter
pip install --user vim-vint
