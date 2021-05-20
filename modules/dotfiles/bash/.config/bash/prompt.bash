source "$(brew --prefix)/opt/gitstatus/gitstatus.prompt.sh"

# NOTE: not entirely sure why, but need to use single quotes to contain this value
# TODO: only render git prompt stuff for git repos
export PS1='\[\e[92m\]\D{%r}\[\e[m\] \[\e[91m\]\u\[\e[m\] \[\e[36m\]\w\[\e[m\]\n|${GITSTATUS_PROMPT:-⌀}| → '
