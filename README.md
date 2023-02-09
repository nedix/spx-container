# spx-docker

## Setup

*docker-compose-spx.yml*

```yaml
version: "3.8"

services:
  nginx-spx:
    image: wodby/nginx:1.19
    environment:
      NGINX_VHOST_PRESET: php
      NGINX_BACKEND_HOST: spx
      NGINX_SERVER_ROOT: '${NGINX_SERVER_ROOT:-/var/www/html/public_html}'
    ports:
      - 8000:80
    volumes:
      - app:/var/www/html

  spx:
    image: spx
    volumes:
      - app:/var/www/html
      - spx:/data/spx
    depends_on:
      - nginx-spx

volumes:
  app:
    driver: local
  spx:
    driver: local
```

## Usage

### Step 1.

Start the containers:

```shell
docker compose -f docker-compose.yml -f docker-compose-spx.yml up -d
```

### Step 2.

Navigate to your page on [localhost:8000](http://localhost:8000) to capture the profiling data.

### Step 3.

Find SPX on [localhost:8000/?SPX_UI_URI=/&SPX_KEY=dev](http://localhost:8000/?SPX_UI_URI=/&SPX_KEY=dev).
