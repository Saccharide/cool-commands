# Plain Command Prompt commands

* Display alternate data stream
```cmd
dir /r
```

* Shutdown immediately
```cmd
shutdown /p
```

* Restart the machine with `/r`, and `/t 0` means in `0` seconds
```cmd
shutdown /r /t 0
```

*  Replace system sound
```cmd
net stop beep
```
* Show file content with `type`
```cmd
type FILE.txt
```

* Set Environmental variables temporarily with `set`
```cmd
set PATH=C:\
```

* Set Environmental variables permanently with `setx`
```cmd
setx PATH C:\
```

* We can use `net user $USER` in Windows as equivalent of `id` in Linux
```cmd
net user $USER
```

* List all other user accounts on the system
```cmd
net user
```

* We can check the integrity level using 
```cmd
whoami /groups
```

* We can check the privilege owned by the current user
```cmd
whoami /priv
```

* Start a command prompt as admin user
```cmd
powershell start-process cmd -Verb runAs
```
* Find out OS name, OS version, and System Type! pretty useful, `/b` match pattern at the beginning of a line, `/c` specifies the literal search string 
```cmd
systeminfo | findstr /b /c:"OS Name" /c:"OS Version" /c:"System Type"
```

* Process Enumeration, listing running process! `/svc` displays services hosted in each process. Running `cmd` as admin can see all running processes.
```cmd
tasklist /svc
```

* Look at the start option for a service using `wmic`
```cmd
wmic service where name="SERVICE_NAME" get name, state, startmode
```
