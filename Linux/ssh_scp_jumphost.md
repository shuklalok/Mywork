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
### Passwordless
Generate ssh key on ```my.current.host``` and copy it to ```my.jump.host``` and ```my.target.host```.
```
ssh-keygen<CR><CR><CR>

ssh myusernameme@my.jump.host 'mkdir -p .ssh'
cat .ssh/id_rsa.pub | ssh myusernameme@my.jump.host 'cat >> .ssh/authorized_keys'
ssh ssh myusernameme@my.jump.host "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"

ssh -J myusernameme@my.jump.host myusername@my.target.host 'mkdir -p .ssh'
cat .ssh/id_rsa.pub | ssh -J myusernameme@my.jump.host myusername@my.target.host 'cat >> .ssh/authorized_keys'
ssh -J myusernameme@my.jump.host myusername@my.target.host "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
```

