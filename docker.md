# Docker

* Building a docker image from `DockerFile`
```
docker build -t CUSTOM_NAME .
```

* Running the docker project, `--rm` is autoremoval on exit, `-d` is running it in the background, `-p` is the publish of the port from localhost to port inside docker
```
docker run --rm -d -p 1050:80 PROJECT
```

* Mount a folder so that we can see live update of the project, `-v` is volume to mount from host directory to docker directory
```
docker run -p 80:80 -v /home/saccharide/docker/src/:/var/www/html/ PROJECT
```

* List all docker processes
```
docker ps -a
```

* Remove docker containers, no need to remove image since they can be used by other containers
```
docker stop CONTAINER_ID
docker rm CONTAINER_ID
```

* Remove docker images if need to save space, `rmi` means rm image
```
docker rmi IMAGE_ID
```

* Remove all running containers
```
docker rm $(docker ps -q)
```

* Remove all images
```
docker rmi -f $(docker images -a -q)
```
