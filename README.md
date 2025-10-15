cd ~/dotfiles
chmod +x bootstrap.sh
./bootstrap.sh

# Clone with submodules
git clone --recurse-submodules https://github.com/yourusername/dotfiles.git

# Or if already cloned
git submodule update --init --recursive
