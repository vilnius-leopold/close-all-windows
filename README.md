close-all-windows
=================

Does what it says.
Gracfully (no force) closes all open [X11](http://www.x.org/) windows.
(X11 is a popular display server; basis for most Linux window managers.)

## Usage

### Desktop Application
`close-all-windows` ships as a discoverable desktop application (`clos-all-windows.desktop` file installed in `/usr/share/applications`). Adding it to your dock or application menu enables you to close all windows with one click.

### CLI
_NOTE_: The script will not execute successfully if you run it from within a window application e.g. a terminal window, because the window running the script will be closed by the script, thus interrupting the script. Run this script from within your window manager or in a background process.

```bash
# plain usage
close-all-windows

# view all cli options
close-all-windows --help

# run a callback command
# after all windows closed
# successfully
# e.g. gracefull shutdown
close-all-windows && shutdown -h now
```

### Config file
The config file allows you to customize the close behaviour and cover edge cases. View [close-all-windows.conf](close-all-windows.conf) for more informations.

A default config file will be install under `/etc/close-all-windows.conf` if installed via package oder manually via make.

If you want to make changes to the config, first copy it to `~/.config/close-all-windows/close-all-windows.conf` and edit it there.


### GUI
[close-all-windows-dialog](https://github.com/vilnius-leopold/close-all-windows-dialog) is a very simple GUI front-end for this script.

## Install from Repository
- [ArchLinux AUR](https://aur.archlinux.org/packages/close-all-windows/)
- [Ubuntu ppa](https://launchpad.net/~vilnius-leopold/+archive/ubuntu/close-all-windows)

## Manual install
Super user permission might be required for the following steps (`sudo` or `su`).

- install `ruby` and `wmctrl`
	- Ubuntu: `apt-get install ruby wmctrl`
	- Arch: `pacman -S ruby wmctrl`
- download and unpack source package
- inside unpacked source directory run `make PREFIX=/usr install`

## ToDo
[TODO List](TODO.md)

## Issues
- Some windows are not (yet) recognized, e.g. the steam client
- Some windows won't close entirely but only go into the background e.g. skype (see config file for work around)
- Some window managers (e.g. i3-wm) don't react to `wmctrl -c`

## Feature requests
So the tool works perfectly for my use case. But possibly you'll need something extra.
I'm a lazy person, so you'll have to request these features/enhancements, else I won't move my butt.