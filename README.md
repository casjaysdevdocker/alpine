# 👋 alpine Readme 👋

alpine README

## Run container

```shell
dockermgr install alpine
```

### via command line

```shell
docker pull casjaysdevdocker/alpine:latest && \
docker run -d \
--restart always \
--name casjaysdevdocker-alpine \
--hostname casjaysdev-alpine \
-e TZ=${TIMEZONE:-America/New_York} \
-v $HOME/.local/share/docker/storage/alpine/alpine/data:/data \
-v $HOME/.local/share/docker/storage/alpine/alpine/config:/config \
-p 80:80 \
casjaysdevdocker/alpine:latest
```

### via docker-compose

```yaml
version: "2"
services:
  alpine:
    image: casjaysdevdocker/alpine
    container_name: alpine
    environment:
      - TZ=America/New_York
      - HOSTNAME=casjaysdev-alpine
    volumes:
      - $HOME/.local/share/docker/storage/alpine/data:/data:z
      - $HOME/.local/share/docker/storage/alpine/config:/config:z
    ports:
      - 80:80
    restart: always
```

## Authors  

🤖 casjay: [Github](https://github.com/casjay) [Docker](https://hub.docker.com/r/casjay) 🤖  
⛵ CasjaysDev: [Github](https://github.com/casjaysdev) [Docker](https://hub.docker.com/r/casjaysdev) ⛵  
