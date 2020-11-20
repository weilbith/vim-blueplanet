" Keywords
syntax keyword dockerfileKeywords FROM MAINTAINER RUN CMD COPY
syntax keyword dockerfileKeywords EXPOSE ADD ENTRYPOINT ENV
syntax keyword dockerfileKeywords VOLUME USER WORKDIR ONBUILD
syntax keyword dockerfileKeywords LABEL ARG HEALTHCHECK SHELL

" Bash statements
syntax keyword bashStatement add-apt-repository adduser apk apt-get aptitude apt-key autoconf bundle
syntax keyword bashStatement cd chgrp chmod chown clear complete composer cp curl du echo egrep
syntax keyword bashStatement expr fgrep find gem gnufind gnugrep gpg grep groupadd head less ln
syntax keyword bashStatement ls make mkdir mv node npm pacman pip pip3 php python rails rm rmdir rpm ruby
syntax keyword bashStatement sed sleep sort strip tar tail tailf touch useradd virtualenv yum
syntax keyword bashStatement usermod bash cat a2ensite a2dissite a2enmod a2dismod apache2ctl
syntax keyword bashStatement wget gzip

" Strings
syntax region dockerfileString start=/"/ skip=/\\"|\\\\/ end=/"/
syntax region dockerfileString1 start=/'/ skip=/\\'|\\\\/ end=/'/

" Emails
syntax region dockerfileEmail start=/</ end=/>/ contains=@ oneline

" URLs
syntax match dockerfileUrl /\(http\|https\|ssh\|hg\|git\)\:\/\/[a-zA-Z0-9\/\-\.]\+/

" Comments
syntax region dockerfileComment start="#" end="\n" contains=dockerfileTodo
syntax region dockerfileEnvWithComment start="^\s*ENV\>" end="\n" contains=dockerfileEnv
syntax match dockerfileEnv contained /\<ENV\>/

" highlight!ing
highlight! link dockerfileKeywords  Keyword
highlight! link dockerfileEnv       Keyword
highlight! link dockerfileString    String
highlight! link dockerfileString1   String
highlight! link dockerfileComment   Comment
highlight! link dockerfileEmail     Identifier
highlight! link dockerfileUrl       Identifier
highlight! link dockerfileTodo      Todo
highlight! link bashStatement       Function


" vim: filetype=vim
