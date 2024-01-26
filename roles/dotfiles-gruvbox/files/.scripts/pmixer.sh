#!/bin/bash

if [ -x "$(command -v sakura)"]; then
  sakura -e zellij -l ~/.config/zellij/layouts/${host}.kdl
elif [ -x "$(command -v wezterm)"]; then
  wezterm start zellij -l ~/.config/zellij/layouts/${host}.kdl
elif [ -x "$(command -v alacritty)"]; then
  alacritty -e zellij -l ~/.config/zellij/layouts/${host}.kdl
fi
