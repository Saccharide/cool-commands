# To set up VPN server on Raspberry Pi

1. Install pivpn 
2. Create a hostname from a Dynamic DNS Provider such as <noip.com>
3. Follow the instruction for pivpn, such as create a custom port and setup a dns address.
4. Setup port-forwarding in router with the custom port associated with Raspberry Pi's local IP address.
5. Create a `iptable.rules` file for forwarding inside `/etc/iptables.rules`
```
*filter
:FORWARD ACCEPT
COMMIT

*nat
-A POSTROUTING -o eth0 -j MASQUERADE
COMMIT
```
6. Create a shell script to restore the iptable rules every time the computer is booted up inside `/etc/network/if-pre-up.d/iptables`
```
#!/bin/sh
/sbin/iptables-restore < /etc/iptables.rules
```
