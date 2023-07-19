```
sed -i '1d' /etc/apt/sources.list && apt update && apt install curl sudo openssh-server && sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1yes/' /etc/ssh/sshd_config && systemctl restart sshd && usermod -aG sudo kashall && su kashall
```

```
mkdir -m 700 ~/.ssh && curl https://github.com/kashalls.keys > ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
```
