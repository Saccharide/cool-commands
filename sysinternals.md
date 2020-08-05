# Sysinternals Suite

## accesschk
Since manually checking the permission of each file is not feasible. We can automate this with `accesschk.exe` from `SysinternalsSuite`

* For example, if we want to find insecure file permission under `C:\Program Files`, that allows the group `Everyone` to have `-uws`, where `u` is to suppress error message, `w` for writable permission, and `s` for recursive search
```cmd
accesschk.exe -uws "Everyone" "C:\Program Files"
```
## sigcheck
We can view its `Application Manifest` with `sigcheck.exe` included in Microsoft's `SysinternalsSuite`.

* `-m` to dump the `Manifest`
```cmd
sigcheck -m c:\Windows\System32\fodhelper.exe
