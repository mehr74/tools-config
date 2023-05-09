if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ tmux ]] && [[ ! "$TMUX_FLAG" =~ set ]]; then
        export TMUX_FLAG=set
        if tmux new-session -s $(date +"%Y-%m-%d.%H-%M-%S") -t main; then
                tmux new-session -s main
        fi
fi
