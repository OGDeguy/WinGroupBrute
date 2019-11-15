# WinGroupBrute

WinGroupBrute is a script that takes a supplied user and attempts to add it to all localgroups and domain groups (with the --domain flag). This script is not stealthy.

## Usage 

Currently there is only a vbs version.

```dos
# Run the script with cscript
> cscript winGroupBrute.vbs

# Get help
> cscript winGroupBrute.vbs --help

Microsoft (R) Windows Script Host Version 5.812
Copyright (C) Microsoft Corporation. All rights reserved.

 _    _ _       _____                      ______            _
| |  | (_)     |  __ \                     | ___ \          | |
| |  | |_ _ __ | |  \/_ __ ___  _   _ _ __ | |_/ /_ __ _   _| |_ ___
| |/\| | | '_ \| | __| '__/ _ \| | | | '_ \| ___ \ '__| | | | __/ _ \
\  /\  / | | | | |_\ \ | | (_) | |_| | |_) | |_/ / |  | |_| | ||  __/
 \/  \/|_|_| |_|\____/_|  \___/ \__,_| .__/\____/|_|   \__,_|\__\___|
                                     | |
                                     |_|        @Deguy    sageisg.com


This script loops through all available groups and attempts to add a user to them.
This script is NOT stealthy.

Arguments:
                        --user          - The user you would like to add to groups (Required)
                        --domain        - Boolean. Attempt to add user to domain groups as well
                        --help          - Print this help text
```

## Example 

```dos
> cscript winGroupBrute.vbs --user Deguy --domain
Microsoft (R) Windows Script Host Version 5.812
Copyright (C) Microsoft Corporation. All rights reserved.

 _    _ _       _____                      ______            _
| |  | (_)     |  __ \                     | ___ \          | |
| |  | |_ _ __ | |  \/_ __ ___  _   _ _ __ | |_/ /_ __ _   _| |_ ___
| |/\| | | '_ \| | __| '__/ _ \| | | | '_ \| ___ \ '__| | | | __/ _ \
\  /\  / | | | | |_\ \ | | (_) | |_| | |_) | |_/ / |  | |_| | ||  __/
 \/  \/|_|_| |_|\____/_|  \___/ \__,_| .__/\____/|_|   \__,_|\__\___|
                                     | |
                                     |_|        @Deguy    sageisg.com

2019-11-15 11:52:11 AM [INFO]   -       Found 18 localgroups.
2019-11-15 11:52:11 AM [INFO]   -       Successfully added user to group: Access Control Assistance Operators
2019-11-15 11:52:11 AM [INFO]   -       Successfully added user to group: Administrators
2019-11-15 11:52:11 AM [INFO]   -       Successfully added user to group: Backup Operators
2019-11-15 11:52:11 AM [INFO]   -       Successfully added user to group: Cryptographic Operators
2019-11-15 11:52:11 AM [INFO]   -       Successfully added user to group: Device Owners
2019-11-15 11:52:11 AM [INFO]   -       Successfully added user to group: Distributed COM Users
2019-11-15 11:52:11 AM [INFO]   -       Successfully added user to group: Event Log Readers
2019-11-15 11:52:11 AM [INFO]   -       Successfully added user to group: Guests
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: Hyper-V Administrators
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: IIS_IUSRS
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: Network Configuration Operators
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: Performance Log Users
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: Performance Monitor Users
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: Power Users
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: Remote Desktop Users
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: Remote Management Users
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: Replicator
2019-11-15 11:52:12 AM [INFO]   -       Successfully added user to group: System Managed Accounts Group
2019-11-15 11:52:12 AM [INFO]   -       Added Deguy to 18 local groups.
2019-11-15 11:52:12 AM [INFO]   -       Found 0 domain groups.
2019-11-15 11:52:12 AM [INFO]   -       Added Deguy to 0 domain groups.
```
