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
# e.g. gracefull shutdown
close-all-windows shutdown -h now

# is equal to
close-all-windows && shutdown -h now
```

## Install
- copy the `close-all-windows` script into your executable directory e.g. `/usr/bin`
- make the script executable `chmod +x close-all-windows`