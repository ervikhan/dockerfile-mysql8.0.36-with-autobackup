USAGE
1. Create all file needed (Dockerfile, debian.cnf, start.sh) in one working directory
2. adjust some words such as password and username
3. Build docker image using
```bash
	docker build -t ubuntu-mysql-autobackup:5.7.39 ./*your_dockerfile_directory*
```
4. Run container
```bash
	docker run -dit ubuntu-mysql-autobackup:5.7.39
```
