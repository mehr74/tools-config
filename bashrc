if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ tmux ]] && [[ ! "$TMUX_FLAG" =~ set ]]; then
        export TMUX_FLAG=set
        if tmux new-session -s $(date +"%Y-%m-%d.%H-%M-%S") -t main; then
                tmux new-session -s main
        fi
fi


socket=$(ls -1t /run/user/$UID/vscode-ipc-*.sock 2> /dev/null | head -1)
export VSCODE_IPC_HOOK_CLI=${socket}
