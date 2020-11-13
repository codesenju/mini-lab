```bash
docker run --name server-1 --net devops --privileged=true -h server-1 -v C:\Temp\Docker\server-1\opt:/opt -v C:\Temp\Docker\server-1\etc\systemd\system:/etc/systemd/system -p 8080-8084:8080-8084 -ti -d mini-lab/centos7
```
