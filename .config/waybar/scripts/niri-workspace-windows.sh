#!/usr/bin/env bash
# niri-workspace-windows - waybar module to show workspace windows

output_state() {
    local workspaces="$1"
    local windows="$2"

    local ws_id active_win_id
    ws_id=$(echo "$workspaces" | jq -r '.[] | select(.is_focused) | .id')
    active_win_id=$(echo "$workspaces" | jq -r '.[] | select(.is_focused) | .active_window_id')

    [[ -z "$ws_id" ]] && printf '{"text":"","class":"niri-workspace-windows"}\n' && return

    # Handle empty workspace or no active window
    if [[ "$active_win_id" == "null" || "$active_win_id" == "" || -z "$active_win_id" ]]; then
        printf '{"text":"","class":"niri-workspace-windows"}\n'
        return
    fi

    local sorted_ids
    sorted_ids=$(echo "$windows" | jq -r --arg ws "$ws_id" \
        '.[] | select(.workspace_id == ($ws | tonumber)) | 
         {id: .id, pos: .layout.pos_in_scrolling_layout // [999, 999]}' |
        jq -sr 'sort_by(.pos[0]) | sort_by(.pos[1]) | .[] | .id')

    local result=""
    while IFS= read -r wid; do
        [[ -z "$wid" ]] && continue
        if [[ "$wid" == "$active_win_id" ]]; then
            result+="●"
        else
            result+="○"
        fi
    done <<<"$sorted_ids"

    printf '{"text":"%s","class":"niri-workspace-windows"}\n' "$result"
}

# Initial state
workspaces=$(niri msg --json workspaces 2>/dev/null)
windows=$(niri msg --json windows 2>/dev/null)
output_state "$workspaces" "$windows"

# Listen for events
niri msg --json event-stream 2>/dev/null | while IFS= read -r line; do
    if [[ "$line" == *"WorkspaceActivated"* || "$line" == *"WindowFocusChanged"* || "$line" == *"WindowLayoutsChanged"* || "$line" == *"WindowOpenedOrChanged"* || "$line" == *"WindowClosed"* ]]; then
        workspaces=$(niri msg --json workspaces 2>/dev/null)
        windows=$(niri msg --json windows 2>/dev/null)
        output_state "$workspaces" "$windows"
    fi
done
