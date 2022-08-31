```bash
sudo usermod -aG docker ubuntu
docker run ubuntu:22.04 /bin/echo "Hello world"
docker run -i -t ubuntu:22.04 /bin/bash
docker run -it ubuntu /bin/bash
docker ps
```

run & stop images

```bash
docker pull training/webapp
docker run -d -P training/webapp python app.py
docker stop 0030d750c7f8
```

```bash
docker run -d -p 5000:5000 training/webapp python app.py
docker port 200d94ab9c03
docker kill 200d94ab9c03
docker stop 200d94ab9c03
```

show images

```bash
docker images
docker image ls
```

remove images

```bash
docker rmi hello-world
docker rmi ubuntu:15.10
```

```
docker commit -m 'add gcc, clang, ssh' -a 'mbs1995' 7e52df956f1a ubuntu-custom
docker commit -m 'update ssh config' -a 'mbs950221' 88d65bcd17ef ubuntu-custom
docker commit -m 'config ssh' -a 'mbs1995' c05e16777d2c ubuntu-custom
docker commit -m 'add htop, update sshd_config' -a 'mbs950221' 9706b150aa61 ubuntu-custom
docker run -d -p 22222:22 --name ubuntu-custom ubuntu-custom /usr/sbin/sshd -D
ssh -p 22222 root@localhost
```

Dockerfile
```
docker build --tag ubuntu -f ./Dockerfile .
docker run --device /dev/fuse --cap-add SYS_ADMIN --name ubuntu -it ubuntu bash
docker cp path/file ubuntu:path/file
docker start ubuntu
docker attach ubuntu
```
