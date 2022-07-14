# https://github.com/rbenv/rbenv/blob/c6cc0a1959da3403f524fcbb0fdfb6e08a4d8ae6/libexec/rbenv#L9-L13
if [ -n "$RBENV_DEBUG" ]; then
  # https://wiki-dev.bash-hackers.org/scripting/debuggingtips#making_xtrace_more_useful
  export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
  set -x
fi

echo "test a"
echo "test b"
echo "test c"
