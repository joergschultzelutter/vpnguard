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
1. In the Finder, locate the application that you have just created
1. Right Mouse Button -> 'Show Package Contents'
1. Edit `Contents/Info.plist`:

Your current Info.plist will look like this
```
	<key>CFBundleSignature</key>
	<string>aplt</string>
	<key>LSMinimumSystemVersionByArchitecture</key>
	<dict>
		<key>x86_64</key>
		<string>10.6</string>
	</dict>
	<key>LSRequiresCarbon</key>
	<true/>
```

Now add these two entries - this change will prevent the application from adding an icon to the MacOS dock: 

```
	<key>LSUIElement</key>
	<true/>
```

Final result will look like this:

```
	<key>CFBundleSignature</key>
	<string>aplt</string>
	<key>LSMinimumSystemVersionByArchitecture</key>
	<dict>
		<key>x86_64</key>
		<string>10.6</string>
	</dict>
	<key>LSRequiresCarbon</key>
	<true/>
	<key>LSUIElement</key>
	<true/>
```
- save the file
- END of configuration steps

## Running the program
1. Add application to your MacOS user account's login items (`Open at login` via MacOS System Settings; run application as type `Application`)
1. Reboot
