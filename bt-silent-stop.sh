#!/bin/bash
pkill l2ping 2>/dev/null
pkill -f "bt-silent.sh" 2>/dev/null
echo "[OK] All BT SILENT processes stopped"
