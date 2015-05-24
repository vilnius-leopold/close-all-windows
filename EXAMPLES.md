## Examples:

### Running from terminal
Close all windows execpt the terminal the script is running on:
```bash
close-all-windows --except $(ps -f -p $$ -o ppid=)
```

### Gracefull shutdown
```bash
# plain usage
close-all-windows && shutdown -h now
```

## Writing debug information to a log file
```
close-all-windows --verbose &>> close-all-windows.log
```

### Run steam
```bash
# plain usage
close-all-windows && steam
```
