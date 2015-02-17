## v0.0.2
- rearchitecture entire script
- remove run callback command. Instead use `close-all-windows && run-my-script`
- add cli options run `close-all-windows --help` for more info
- add exit codes for success and fail
- fix cropped window title
- ignore unrecognized windows with pid = 0