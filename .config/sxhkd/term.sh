#!/usr/bin/env bash

# Ensure Nix profile is in PATH for sxhkd
export PATH="$HOME/.nix-profile/bin:$PATH"

FLOATING=0
GEOM=""

# Parse custom wrapper flags
while [[ "$1" == --* ]]; do
  case "$1" in
    --floating)
      FLOATING=1
      shift
      ;;
    --geometry=*)
      GEOM="${1#*=}"
      shift
      ;;
    *)
      break
      ;;
  esac
done

# Pick first available terminal: konsole -> lxterminal -> urxvt
for t in konsole lxterminal urxvt; do
  if command -v "$t" >/dev/null 2>&1; then
    TERM_BIN="$t"
    break
  fi
done

case "$TERM_BIN" in
  konsole)
    ARGS=()
    if [[ "$FLOATING" -eq 1 ]]; then
      # Give the window a unique title so i3-msg targets only this instance
      WIN_TITLE="Floating_$$"
      ARGS+=(--qwindowtitle "$WIN_TITLE" -p tabtitle="Floating")
    fi
    if [[ $# -gt 0 ]]; then
      ARGS+=(-e "$@")
    fi

    if [[ "$FLOATING" -eq 1 && -n "$GEOM" ]]; then
      COLS="${GEOM%x*}"
      ROWS="${GEOM#*x}"
      PX_W=$(( COLS * 9 ))
      PX_H=$(( ROWS * 19 ))

      konsole "${ARGS[@]}" &
      # Wait briefly for Konsole to map, then resize and center via i3-msg
      sleep 0.35
      i3-msg "[title=\"^${WIN_TITLE}\"] resize set ${PX_W} px ${PX_H} px, move position center" >/dev/null
      wait
    else
      exec konsole "${ARGS[@]}"
    fi
    ;;
  # konsole)
    #   ARGS=()
    #   # Set window title/class to "Floating" so bspwm rules still catch it
    #   [[ "$FLOATING" -eq 1 ]] && ARGS+=(--qwindowtitle "Floating" -p tabtitle="Floating")
    #   if [[ $# -gt 0 ]]; then
    #     ARGS+=(-e "$@")
    #   fi
    #   exec konsole "${ARGS[@]}"
    #   ;;
  lxterminal)
    ARGS=()
    [[ "$FLOATING" -eq 1 ]] && ARGS+=(-t "Floating")
    [[ -n "$GEOM" ]] && ARGS+=(--geometry="$GEOM")
    if [[ $# -gt 0 ]]; then
      ARGS+=(-e "$@")
    fi
    exec lxterminal "${ARGS[@]}"
    ;;
  urxvt)
    ARGS=()
    [[ "$FLOATING" -eq 1 ]] && ARGS+=(-name "Floating" -title "Floating")
    [[ -n "$GEOM" ]] && ARGS+=(-geometry "$GEOM")
    if [[ $# -gt 0 ]]; then
      ARGS+=(-e "$@")
    fi
    exec urxvt "${ARGS[@]}"
    ;;
esac

