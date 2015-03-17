## v0.0.5
- add --except-process CLI option

## v0.0.4
- fix force option bug that caused close-all-windows to return non zero exit status
- add some more debug info

## v0.0.3
- add config for window customizations
- Fix bug with wrong/turncated process_name
- Add process_command field
- clean up stdout and add `--verbose` flag for debugging

## v0.0.2
- rearchitecture entire script
- remove run callback command. Instead use `close-all-windows && run-my-script`
- add cli options run `close-all-windows --help` for more info
- add exit codes for success and fail
- fix cropped window title
- ignore unrecognized windows with pid = 0