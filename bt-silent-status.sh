#!/bin/bash
if pgrep l2ping >/dev/null; then
    echo "[RUNNING] BT SILENT — Active processes: $(pgrep -c l2ping)"
else
    echo "[STOPPED] BT SILENT is not running"
fi
