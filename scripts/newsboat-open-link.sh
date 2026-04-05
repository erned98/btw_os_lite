#!/usr/bin/env bash
# Simple script to redirect url's opened from terminal.

# A function containing a case list of options 
open() {
    case "$1" in
        *youtube.com*|*youtu.be*|*odysee.com*|*cda.pl*|*vodlocker.com*|*.webm*|*.mp4*|*.avi)  mpv "$1";;
        *.mp3*)  mpv --no-video "$1";;
        *.png*|*.jpeg*|*.gif*|*.jpg*|*.webp*) feh -Tdefault -F "$1";;  # feh -. = opens to fit window.
        *reddit.com/gallery*|*v.redd.it*) brave "$1";;  # Show me my unixp0rn.
		*) rdrview "$1" -H | w3m -T text/html;  # For everything else.;
    esac
}

# Now a for loop to iterate the list of options, 
for url; do
    open "$url"
done
