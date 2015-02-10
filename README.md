close-all-windows
=================

Does what it says.
Gracfully (no force) closes all open X11 windows.
(X11 is a popular display server; basis for most Linux window managers.)

## Usage

_NOTE_: The script will not execute successfully if you run it from within a window application e.g. a terminal window, because the window running the script will be closed by the script, thus interrupting the script. Run this script from within your window manager or in a background process.

```bash
# plain usage
close-all-windows

# optionally run a callback command
# after all windows are closed
#
# e.g. graceful shutdown
close-all-windows shutdown -h now

# is equal to
close-all-windows && shutdown -h now
```

## Install from Repository
- [ArchLinux AUR](https://aur.archlinux.org/packages/close-all-windows/)

## Manual install
Super user permission are required for the following steps (`sudo` or `su`).

- install `ruby` and `wmctrl`
	- Ubuntu: `apt-get install ruby wmctrl`
	- Arch: `pacman -S ruby wmctrl`
- copy script into your executable directory `cp close-all-windows /usr/bin/close-all-windows`
- make the script executable `chmod +x /usr/bin/close-all-windows`