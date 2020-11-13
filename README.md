```bash
docker run --name server-1 --net devops --privileged=true -h server-1 -v C:\Temp\Docker\server-1\opt:/opt -v C:\Temp\Docker\server-1\etc\systemd\system:/etc/systemd/system -p 8080-8084:8080-8084 -ti -d mini-lab/centos7
```


## Service

```bash
tee -a test.sh > /dev/null <<EOT
[Unit]
Description=${SERVICE}
After=network.target
[Service]
Type=simple
User=${SERVICE}
ExecStart=
[Install]
WantedBy=multi-user.target      
EOT
```

## Add user to sudoers
```bash
echo "${SERVICE} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/${SERVICE} 
```
