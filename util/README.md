# Util
Various useful utilities

## disable_wake_from_sleep_devices.ps1
`disable_wake_from_sleep_devices.ps1` helps disable any device in windows that would wake the computer from sleep.

## port_scan.ps1
`port_scan.ps1` is simple script to scan network for ports that are open.

## addons-and-aliases.ps1
`addons-and-aliases.ps1` contains some powershell addons to add to powershell profile.  

### Panda Art
This will display a random Panda Art when opening powershell instance.

### Open
This mimics the `zsh` command `open` by using the powershell `Invoke-Item` or `ii` command to open File Explore in the selected path.  
Default path is `.`, the current location.  

## oh-my-posh
Oh My Posh configuration. More details can be found in the README in the `/oh-my-posh` directory.

# Powershell Profile
Modifying powerful profile commands

Editing
```ps
notepad $PROFILE
```

Reloading
```ps
. $PROFILE
```
