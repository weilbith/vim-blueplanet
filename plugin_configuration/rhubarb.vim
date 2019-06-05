let s:token_file_path = g:base_folder . '/secrets/github_token.gpg'

if !executable('gpg')
  call utils#messages#warning('GnuPG is not available. Can not decrypt GitHub token!')

elseif !filereadable(s:token_file_path)
  call utils#messages#warning(
        \ 'Can not find github token file (expected here: ' . s:token_file_path .')')

else
  let s:token = system('gpg --decrypt --quiet ' . s:token_file_path)

  if s:token =~? 'failed'
    call utils#messages#warning('Failed to decrypt github token:')
    call utils#messaegs#warning(s:token)

  else
    let g:RHUBARB_TOKEN = s:token
  endif
endif
