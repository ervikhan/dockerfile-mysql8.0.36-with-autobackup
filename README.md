**USAGE**
1. Make sure you have a Linux server that has Docker installed
2. Clone all files needed to your server (Dockerfile, debian.cnf, start.sh) in one working directory
3. Customize username, password, etc
4. Build docker image using
```bash
docker build -t ubuntu-mysql-autobackup:8.0.36 ./
```
5. Run container
```bash
docker run -dit ubuntu-mysql-autobackup:8.0.36
```
