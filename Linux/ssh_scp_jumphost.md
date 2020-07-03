### SSH
If ```username``` on my.current.host is same as on my.jump.host and my.target.host:
```
ssh -J my.jump.host my.target.host
```
If ```username``` is different on both the hosts:
```
ssh -J myusernameme@my.jump.host myusername@my.target.host
```
### SCP
If ```username``` on my.current.host is same as on my.jump.host and my.target.host:
```
scp -o 'ProxyJump my.jump.host' my.file my.target.host:/mydir/mysubdir/
```
If ```username``` is different on both the hosts:
```
scp -o 'ProxyJump my.jump.host' my.file myusername@my.target.host:/mydir/mysubdir/
```
