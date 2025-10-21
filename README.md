# Docker container for Dokuwiki
[![Docker Image Size](https://img.shields.io/docker/image-size/alandoyle/dokuwiki/latest?logo=docker&style=for-the-badge)](https://hub.docker.com/r/alandoyle/dokuwiki/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/alandoyle/dokuwiki?label=Pulls&logo=docker&style=for-the-badge)](https://hub.docker.com/r/alandoyle/dokuwiki)
[![Source](https://img.shields.io/badge/Source-GitHub-blue?logo=github&style=for-the-badge)](https://github.com/alandoyle/docker-dokuwiki)

This is a Docker container for [Dokuwiki](https://www.dokuwiki.org/dokuwiki).

---

[![Dokuwiki logo](https://images.weserv.nl/?url=raw.githubusercontent.com/alandoyle/docker-dokuwiki/main/Dokuwiki-logo.png&w=110)](https://www.dokuwiki.org/dokuwiki)[![Dokuwiki](https://images.placeholders.dev/?width=256&height=110&fontFamily=monospace&fontWeight=400&fontSize=52&text=Dokuwiki&bgColor=rgba(0,0,0,0.0)&textColor=rgba(121,121,121,1))](https://www.dokuwiki.org/dokuwiki)

An enhanced Dokuwiki installation with some extra features.

+ [github-tags-en](https://github.com/davidjimenez75/dokuwiki-smileys-local) by Davidjimenez7
+ [Bootstrap 3 theme](https://github.com/giterlizzi/dokuwiki-template-bootstrap3) by Giuseppe Di Terlizzi
+ Clean URLS using mod_rewrite

---

## Docker

Available on [DockerHub](https://hub.docker.com/r/alandoyle/dokuwiki)
```bash
docker pull alandoyle/dokuwiki
```

---

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

---

### Ports

| Port     | Description           |
|----------|-----------------------|
| `80/tcp` | HTTP                  |

---

### Volumes

| Path    | Description                           |
|---------|---------------------------------------|
| `/var/www/html/conf` | path for Dokuwiki configuration files |
| `/var/www/html/data` | path for Dokuwiki data files          |
