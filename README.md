```bash
docker run --name <pod-name> --net devops --privileged=true -h <pod-name> --restart always -v C:\Temp\Docker\<pod-name>\opt:/opt -v C:\Temp\Docker\<pod-name>\etc\systemd\system:/etc/systemd/system -p 8080-8084:8080-8084 -ti -d mini-lab/centos7
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
