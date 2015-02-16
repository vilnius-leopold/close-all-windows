close-all-windows
=================

Does what it says.
Gracfully (no force) closes all open [X11](http://www.x.org/) windows.
(X11 is a popular display server; basis for most Linux window managers.)

## Usage

_NOTE_: The script will not execute successfully if you run it from within a window application e.g. a terminal window, because the window running the script will be closed by the script, thus interrupting the script. Run this script from within your window manager or in a background process.

### CLI
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

### GUI
[close-all-windows-dialog](https://github.com/vilnius-leopold/close-all-windows-dialog) is a very simple GUI front-end for this script.

## Install from Repository
- [ArchLinux AUR](https://aur.archlinux.org/packages/close-all-windows/)

## Manual install
Super user permission are required for the following steps (`sudo` or `su`).

- install `ruby` and `wmctrl`
	- Ubuntu: `apt-get install ruby wmctrl`
	- Arch: `pacman -S ruby wmctrl`
- copy script into your executable directory `cp close-all-windows /usr/bin/close-all-windows`
- make the script executable `chmod +x /usr/bin/close-all-windows`

## Feature requests
So the tool works perfectly for my use case. But possibly you'll need something extra. Things i can think of:

- `--detach` option, to detach script from parent process (e.g. when running from terminal window)
- ubuntu ppa package or what ever package manager
- `--force-close` option to kill windows that don't close
- `--max-wait` option to set max time to wait for window to close (before killing it). Currentl default are 5 seconds.
- `--force-run` option to ensure to run the callback even if closing all windows in time fails
- `--run-on-fail` option to run an alterative callback when windows don't close in time
- `--except`/`--exclude` option to exclude windows from being closed

I'm a lazy person, so you'll have to request these (or any other) features/enhancements, else I won't move my butt.