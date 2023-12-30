#
# VPNGuard AppleScript
# Author: Joerg Schultze-Lutter, 2016
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#
# Amend the following settings:
#
# MyApplicationName - the name of the app that is to be terminated if the VPN tunnel fails
# MyInterfaceName - interface name of your VPN tunnel
#
# How to use this script:
# 1) open in MacOS Script Editor
# 2) Amend Application Name and Interface Name
# 3) Save Script as Application ( File -> Save -> File Format: "Application")
# 4) Add application to your MacOS user account's login items ("Open at login" via MacOS System Settings; run application as type "Application")
# 5) reboot


set MyApplicationName to "MyApplication"
set MyInterfaceName to "utun10"

display notification "VPNGuard active - Guarding application '" & MyApplicationName & "' on interface '" & MyInterfaceName & "'" with title "VPNGuard"

on idle
	
	set activeInterfaces to do shell script "ifconfig -lu"
	set activeInterfacesString to (activeInterfaces) as string
	
	set AppleScript's text item delimiters to " "
	set the activeInterfacesList to every text item of the activeInterfacesString
	set AppleScript's text item delimiters to ""
	if activeInterfacesList does not contain MyInterfaceName then
		tell application "System Events"
			set ProcessList to name of every process
			if MyApplicationName is in ProcessList then
				beep
				beep
				beep
				tell application MyApplicationName to quit
				display notification "VPN tunnel '" & MyInterfaceName & "' is down - I have quit '" & MyApplicationName & "'" with title "VPNGuard"
			end if
		end tell
	end if
	return 5
end idle