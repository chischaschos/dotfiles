vim.cmd [[
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark
]]
