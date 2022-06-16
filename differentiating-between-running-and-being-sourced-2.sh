#!/bin/bash

# https://unix.stackexchange.com/questions/214079/differentiating-between-running-and-being-sourced-in-a-bash-shell-script/215279#215279
function _is_sourced () {
  [[ "${FUNCNAME[1]}" == "source" ]]  && return 0
  return 1
}

# If we are sourced from elsewhere, don't perform any further actions
if ! _is_sourced; then
  echo "Not sourced!"
fi
