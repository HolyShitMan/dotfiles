#!/bin/bash
dir="~/.vim/pack/my_plugins/start"
mkdir -p $dir
cd $dir || ( echo "Could not create directory $dir" && exit -1 )

git clone https://github.com/w0rp/ale.git
git clone https://github.com/vim-scripts/DoxygenToolkit.vim.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/Yggdroot/indentLine.git
git clone https://github.com/davidhalter/jedi-vim.git
git clone https://github.com/LucHermitte/lh-vim-lib.git
git clone https://github.com/LucHermitte/local_vimrc.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/ervandew/supertab
git clone https://github.com/juneedahamed/svnj.vim.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/mbbill/undotree.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/junegunn/vim-easy-align.git
git clone https://github.com/tpope/vim-eunuch.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/TakeshiTseng/vim-language-p4.git
git clone https://github.com/terryma/vim-multiple-cursors.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git
git clone https://github.com/nathanalderson/yang.vim.git

