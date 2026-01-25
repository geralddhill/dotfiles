#!/bin/bash

PROJECT_DIR="~/Documents/Programs/matchup/"
SESSION_NAME="matchup"

# Check if the session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
  echo "Session already exists. Attaching..."
  tmux attach -t $SESSION_NAME
  exit 0
fi

tmux new-session -d -s $SESSION_NAME

tmux send-keys -t $SESSION_NAME:1 "cd $PROJECT_DIR" C-m
tmux send-keys -t $SESSION_NAME:1 "npx supabase start" C-m
sleep 1
tmux send-keys -t $SESSION_NAME:1 "y" C-m
sleep 5
tmux send-keys -t $SESSION_NAME:1 "npm run dev" C-m

tmux split-window -h
tmux send-keys -t $SESSION_NAME:1 "cd $PROJECT_DIR" C-m
tmux attach-session -t $SESSION_NAME:1.2
