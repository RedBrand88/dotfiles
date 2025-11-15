cd ~/dotfiles
chmod +x bootstrap.sh
./bootstrap.sh

# Clone with submodules
```bash
git clone --recurse-submodules https://github.com/yourusername/dotfiles.git
```
# Or if already cloned
```bash
git submodule update --init --recursive
```
