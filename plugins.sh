# plugins.sh
# ----------
# Installs plugins via pathogen.vim
#
# Can be run on OS X and Linux, or Windows. If running on Windows you'll need
# to replace .vim in the paths for installing pathogen with vimfiles.
#
# TODO set this via env var

# From https://github.com/tpope/vim-pathogen with .vim replaced with vimfiles
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

# Install some plugins
cd ~/.vim/bundle
git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/tomtom/tlib_vim.git
git clone git://github.com/vimoutliner/vimoutliner.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/mattn/emmet-vim.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/mxw/vim-jsx.git
git clone git@github.com:blindFS/vim-taskwarrior.git
git clone git@github.com:jiangmiao/auto-pairs.git
git clone git@github.com:terryma/vim-expand-region.git
git clone git://github.com/tpope/vim-fugitive.git
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
