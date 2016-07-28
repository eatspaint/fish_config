set -g -x PATH /usr/local/bin $PATH
set -g -x fish_greeting ''
set PATH "$HOME/.rbenv/shims" $PATH
set PATH "/Applications/Postgres.app/Contents/Versions/9.4/bin" $PATH
rbenv rehash ^/dev/null

function rbenv
  set -l command $argv[1]
  if test (count $argv) -gt 1
  set argv $argv[2..-1]
end

switch "$command"
  case rehash shell
    eval (rbenv "sh-$command" $argv)
  case '*'
    command rbenv "$command" $argv
  end
end

bass source ~/.nvm/nvm.sh --no-use ';' nvm

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

clear
