#!/bin/sh
set -ex
if type find &>/dev/null; then
	printf "\n"
else
	printf "missing findutils\n"
	exit 1
fi
_basedir="$(dirname "$(readlink -f "${0}")")"
cd "$_basedir"
if [ -d "$_basedir"/icons ]; then
	rm -rf "$_basedir"/icons
fi
mkdir -p "$_basedir"/icons
###16px
for _f in $(find "$_basedir"/../../../../../icons/DarK/16x16/pool -mindepth 1 -type f -name '*.png' \
-not -name "gnome-*" -not -name "x-content*" -not -name "application-*" -not -name "image-*" \
-not -name "audio-*" -not -name "video-*" -not -name "stock_*" -not -name "stock-*" \
-not -name "battery-*" -not -name "csd-*" -not -name "cs-*" -not -name "gimp-*" -not -name "gpm-*" \
-not -name "gtk-*" -not -name "mypaint-*" -not -name "org.*" -not -name "package_*" -not -name "pidgin-*" \
-not -name "si-*" -not -name "weather-*" -not -name "xfce4-*" -not -name "xfce-*" -not -name "xfpm-*" -not -name "yast-*" \
-not -name "view-*" -not -name "zoom-*" -not -name "document-*" -not -name "zoom-*" -not -name "view-*" -not -name "edit-*" \
-not -name "edit-*" -not -name "fcitx-*" -not -name "e-module-*" -not -name "path-*" -not -name "media-*" -not -name "draw-*" \
-not -name "applications-*" -not -name "brasero-*" -not -name "blueman-*" -not -name "format-*" -not -name "network-*" \
-not -name "nm-*" -not -name "object-*" -not -name "package-*" -not -name "text-*" -not -name "tool-*" -not -name "mate-*" \
-not -name "align-*" -not -name "bluebery-*" -not -name "byzanz-*" -not -name "paint-*" -not -name "*-applet-*" -not -name "show-*");do
	ln -sf $_f $(echo $_f| sed 's\^.*/\icons/\;s\.png\_16x16.png\')
done
for _f in $(find "$_basedir"/../../../../../icons/DarK/32x32/pool -mindepth 1 -type f -name '*.png' \
-not -name "gnome-*" -not -name "x-content*" -not -name "application-*" -not -name "image-*" \
-not -name "audio-*" -not -name "video-*" -not -name "stock_*" -not -name "stock-*" \
-not -name "battery-*" -not -name "csd-*" -not -name "cs-*" -not -name "gimp-*" -not -name "gpm-*" \
-not -name "gtk-*" -not -name "mypaint-*" -not -name "org.*" -not -name "package_*" -not -name "pidgin-*" \
-not -name "si-*" -not -name "weather-*" -not -name "xfce4-*" -not -name "xfce-*" -not -name "xfpm-*" -not -name "yast-*" \
-not -name "view-*" -not -name "zoom-*" -not -name "document-*" -not -name "zoom-*" -not -name "view-*" -not -name "edit-*" \
-not -name "edit-*" -not -name "fcitx-*" -not -name "e-module-*" -not -name "path-*" -not -name "media-*" -not -name "draw-*" \
-not -name "applications-*" -not -name "brasero-*" -not -name "blueman-*" -not -name "format-*" -not -name "network-*" \
-not -name "nm-*" -not -name "object-*" -not -name "package-*" -not -name "text-*" -not -name "tool-*" -not -name "mate-*" \
-not -name "align-*" -not -name "bluebery-*" -not -name "byzanz-*" -not -name "paint-*" -not -name "*-applet-*" -not -name "show-*");do
	ln -sf $_f $(echo $_f| sed 's\^.*/\icons/\;s\.png\_32x32.png\')
done
