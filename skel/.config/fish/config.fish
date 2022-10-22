set fish_greeting

set -x PATH $PATH ~/.npm-global/bin

direnv hook fish | source


if status is-interactive
  # Commands to run in interactive sessions can go here
end