" Vim syntax file
" Language: Packer
" Acknowledgment: https://github.com/cakebaker/scss-syntax.vim/blob/master/syntax/scss.vim

if exists('b:current_syntax')
  finish
endif

runtime! syntax/json.vim

syntax keyword topLevelKeys builders provisioners

highlight def link topLevelKeys Tag
