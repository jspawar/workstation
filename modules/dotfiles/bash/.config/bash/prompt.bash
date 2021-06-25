source "$(brew --prefix)/opt/gitstatus/gitstatus.prompt.sh"

# NOTE: not entirely sure why, but need to use single quotes to interpolate `GITSTATUS_PROMPT`
# NOTE: PS1 must be set to whatever I like wherever the above file is sourced (that file tries to set PS1 too)
# TODO: only render git prompt stuff for git repos
# TODO: render exit status of previous command
# TODO: render time to run previous command
function my_prompt_command() {
    local prev_exit="$?"

    gitstatus_prompt_update

    local green="\[\e[92m\]"
    local red="\[\e[91m\]"
    local blue="\[\e[36m\]"
    local reset="\[\e[m\]"

    local exit_string
    if [ ${prev_exit} -eq 0 ]; then
        exit_string="${blue}Exit: ${prev_exit}${reset}"
    else
        exit_string="${red}Exit: ${prev_exit}${reset}"
    fi

    local _gitstatus
    if [ -n "${GITSTATUS_PROMPT}" ]; then
        _gitstatus=" - ${GITSTATUS_PROMPT}"
    fi

    PS1="${green}\D{%r}${reset} ${red}\u${reset} ${blue}\w${reset}${_gitstatus}\n"
    PS1+="|${exit_string}| → "
}
export PROMPT_COMMAND=my_prompt_command
