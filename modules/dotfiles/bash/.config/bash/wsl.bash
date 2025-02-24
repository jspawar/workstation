# random stuff for support with WSL
if [ -n $WSL_DISTRO_NAME ]; then
  # ensure editors render colors correctly
  export COLORTERM=truecolor

  # ensure SSH environment is set for running agent
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
