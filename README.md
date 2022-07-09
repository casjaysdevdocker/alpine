# 👋 alpine Readme 👋

alpine README

## Run container

```shell
dockermgr install alpine
```

### via command line

```shell
docker run -d \
--restart always \
--name alpine \
--hostname casjaysdev-alpine \
-e TZ=${TIMEZONE:-America/New_York} \
-v $PWD/alpine/data:/data \
-v $PWD/alpine/config:/config \
-p 80:80 \
casjaysdev/alpine:latest
```

### via docker-compose

```yaml
version: "2"
services:
  alpine:
    image: casjaysdev/alpine
    container_name: alpine
    environment:
      - TZ=America/New_York
      - HOSTNAME=casjaysdev-alpine
    volumes:
      - $HOME/.local/share/docker/storage/alpine/data:/data
      - $HOME/.local/share/docker/storage/alpine/config:/config
    ports:
      - 80:80
    restart: always
```

## Authors  

🤖 Jason Hempstead: [Github](https://github.com/Jason Hempstead) [Docker](https://hub.docker.com/Jason Hempstead) 🤖  
⛵ CasjaysDev: [Github](https://github.com/casjaysdev) [Docker](https://hub.docker.com/casjaysdev) ⛵  
