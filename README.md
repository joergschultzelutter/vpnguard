# vpnguard

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

AppleScript snippet which checks if your VPN tunnel is down and terminates a given app in response

Amend the following settings:

- `MyApplicationName` - the name of the app that is to be terminated if the VPN tunnel fails
- `MyInterfaceName` - interface name of your VPN tunnel

How to use this script:
1. open in MacOS Script Editor
1. Amend Application Name and Interface Name
1. Save Script as Application ( `File` -> `Save` -> `File Format`: `Application`)
1. Add application to your MacOS user account's login items (`Open at login` via MacOS System Settings; run application as type `Application`)
1. Reboot
