#!/usr/bin/env bash

niri msg --json event-stream 2>/dev/null | jq -cn --unbuffered '
    def render:
        (.workspaces[]? | select(.is_focused)) as $ws
        | if $ws == null or $ws.active_window_id == null then
            {text: "", class: "waybar-niri-windows"}
          else
            {
              text: (
                .windows
                | map(select(.workspace_id == $ws.id))
                | sort_by(.layout.pos_in_scrolling_layout // [999, 999])
                | map(if .id == $ws.active_window_id then "" else "" end)
                | join(" ")
              ),
              class: "waybar-niri-windows"
            }
          end;

    foreach inputs as $event (
        {workspaces: [], windows: []};

        if $event.WorkspacesChanged then
            .workspaces = $event.WorkspacesChanged.workspaces
        elif $event.WorkspaceActivated and $event.WorkspaceActivated.focused then
            .workspaces |= map(.is_focused = (.id == $event.WorkspaceActivated.id))
        elif $event.WorkspaceActiveWindowChanged then
            .workspaces |= map(
                if .id == $event.WorkspaceActiveWindowChanged.workspace_id then
                    .active_window_id = $event.WorkspaceActiveWindowChanged.active_window_id
                else
                    .
                end
            )
        elif $event.WindowsChanged then
            .windows = $event.WindowsChanged.windows
        elif $event.WindowOpenedOrChanged then
            .windows |= map(select(.id != $event.WindowOpenedOrChanged.window.id)) + [$event.WindowOpenedOrChanged.window]
        elif $event.WindowClosed then
            .windows |= map(select(.id != $event.WindowClosed.id))
        elif $event.WindowLayoutsChanged then
            reduce $event.WindowLayoutsChanged.changes[] as $change (.;
                .windows |= map(
                    if .id == $change[0] then
                        .layout = $change[1]
                    else
                        .
                    end
                )
            )
        else
            .
        end;

        if (
            $event.WorkspacesChanged
            or $event.WorkspaceActivated
            or $event.WorkspaceActiveWindowChanged
            or $event.WindowsChanged
            or $event.WindowOpenedOrChanged
            or $event.WindowClosed
            or $event.WindowLayoutsChanged
        ) then
            render
        else
            empty
        end
    )
'
