#!/bin/bash
tmuxsessions=$(tmux list-sessions -F '#S#{?session_attached,attached,}' | grep -v attached)

tmux_switch_to_session() {
  session="$1"
  echo "hello"
  echo "$tmuxsessions"
  # if [[ $tmuxsessions = "$session" ]]; then
    # tmux switch-client -t "$session"
    # tmux switch-client -t "$session"
    tmux choose-tree -t "$session"
  # fi

}

choice=$(sort -fu <<< "$tmuxsessions" \
  | fzf-tmux \
    -p \
    --border=none \
    --info=hidden \
    --layout=reverse \
    --preview='~/.config/tmux/scripts/switch-session-preview.sh {}' \
    --pointer='>'  \
  | tr -d '\n'
)
    # --pointer='🖝 '  \

if [[ "${choice}" != "" ]]; then
  tmux_switch_to_session "$choice"
fi
