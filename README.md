# alandoyle/dokuwiki

![Dokuwiki](https://www.dokuwiki.org/lib/tpl/dokuwiki/images/logo.png)

An enhanced Dokuwiki installation with some extra features.

+ [github-tags-en](https://github.com/davidjimenez75/dokuwiki-smileys-local) by Davidjimenez7
+ [Bootstrap 3 theme](https://github.com/giterlizzi/dokuwiki-template-bootstrap3) by Giuseppe Di Terlizzi
+ Clean URLS using mod_rewrite

## Docker 

Available on [DockerHub](https://hub.docker.com/r/alandoyle/dokuwiki)
```bash
docker pull alandoyle/dokuwiki
```

## Usage

```bash
docker run --name=dokuwiki \
  -d --init \
  -v <MY_CONF_PATH>:/var/www/html/conf \
  -v <MY_DATA_PATH>:/var/www/html/data \
  -p 8000:80/tcp \
  alandoyle/dokuwiki:latest
```

Docker compose example:

```yaml
services:
  dokuwiki:
   image: alandoyle/dokuwiki:latest
   container_name: dokuwiki
   restart: unless-stopped
   init: true
   ports:
     - "8000:80/tcp"
   volumes:
     - ./dokuwiki/conf:/var/www/html/conf
     - ./dokuwiki/data:/var/www/html/data
```

### Ports

| Port     | Description           |
|----------|-----------------------|
| `80/tcp` | HTTP                  |

### Volumes

| Path    | Description                           |
|---------|---------------------------------------|
| `/var/www/html/conf` | path for Dokuwiki configuration files |
| `/var/www/html/data` | path for Dokuwiki data files          |
