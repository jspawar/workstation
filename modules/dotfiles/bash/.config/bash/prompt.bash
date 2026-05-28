# TODO: render exit status of previous command
# TODO: render time to run previous command
function my_prompt_command() {
    local prev_exit="$?"

    local green="\[\e[92m\]"
    local red="\[\e[91m\]"
    local blue="\[\e[36m\]"
    local reset="\[\e[m\]"

    local exit_string
    # exit code 130 indicates interrupted by `C-c` which I don't want to report as an error
    if [ ${prev_exit} -ne 0 ] && [ ${prev_exit} -ne 130 ]; then
        exit_string="❌ ${red}Exit: ${prev_exit}${reset} "
    fi

    local _gitstatus
    if [ -n "${GITSTATUS_PROMPT}" ]; then
        _gitstatus=" - ${GITSTATUS_PROMPT}"
    fi

    PS1="${red}\u${reset} ${blue}\w${reset}${_gitstatus}\n"
    PS1+="🕥 ${green}[\D{%r}]${reset} ${exit_string}→ "
}

function powerline_go_prompt() {
    local _prev_exit_code="$?"
    local _powerline_go_path="${HOME}/go/bin/powerline-go"

    if [ -f "${_powerline_go_path}" ]; then
        PS1="$(${_powerline_go_path} \
            -cwd-mode "plain" \
            -hostname-only-if-ssh \
            -modules "user,host,ssh,cwd,git,jobs,exit,time" \
            -newline \
            -error ${_prev_exit_code} \
            -jobs $(jobs -p | wc -l))"
    else
        my_prompt_command
    fi
}

# NOTE: `_direnv_hook` is loaded by `direnv.bash` and relying on that being loaded first
export PROMPT_COMMAND="powerline_go_prompt && _direnv_hook"
