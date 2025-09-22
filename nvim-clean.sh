#!/bin/bash
# Wrapper script to start Neovim without the lspconfig deprecation warning
# Save this as ~/bin/nvim-clean and make it executable: chmod +x ~/bin/nvim-clean

~/Downloads/nvim-linux-x86_64/bin/nvim "$@" 2>&1 | grep -v "require('lspconfig')" | grep -v "Feature will be removed in nvim-lspconfig"
