export TERM=screen-256color
tmux setenv TMUX_FLAG "set"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ tmux ]] && [[ ! "$TMUX_FLAG" =~ set ]]; then
        export TMUX_FLAG=set
        tmux attach
fi  
