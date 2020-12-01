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


## Container Environment
- ### Mini-Lab
```bash
docker run --name lab-# --net devops --restart always --privileged=true -h lab-# -v C:\Temp\Docker\lab-#\opt:/opt -v C:\Temp\Docker\lab-#\etc\systemd\system:/etc/systemd/system -p <ports> -ti -d mini-lab/centos7
```
- ### Bamboo Server
```bash
docker run -v C:\Temp\Docker\bamboo:/var/atlassian/application-data/bamboo --restart always --name bamboo-server --network devops --hostname bamboo-server --init -d -p 9101:8085 -p 54663:54663 atlassian/bamboo-server:6.6.3
```
- ### Grafana HA
```bash
docker run --name lab-# --net devops --restart always --privileged=true -h lab-# -v C:\Temp\Docker\lab-#\opt:/opt -v C:\Temp\Docker\lab-#\etc\systemd\system:/etc/systemd/system -p <ports>  -ti -d grafana-template
```
