#!/bin/bash
if pgrep l2ping >/dev/null; then
    echo "[RUNNING] BT SILENT — Processes: $(pgrep -c l2ping)"
else
    echo "[STOPPED] BT SILENT not running"
fi
