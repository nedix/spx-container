# spx-container

Use the [PHP SPX][SPX] extension to gain insight into performance metrics of a PHP application.

## Setup

#### Create a Docker Compose manifest

This example Docker Compose manifest expects that you have your main application services defined in `docker-compose.yml`. It will listen for requests on port `81`.

*docker-compose-spx.yml*

```yaml
services:
  nginx-spx:
    image: wodby/nginx:1.19
    environment:
      NGINX_VHOST_PRESET: php
      NGINX_BACKEND_HOST: spx
      NGINX_SERVER_ROOT: /var/www/html/public_html
    ports:
      - 81:80
    volumes:
      - app:/var/www/html

  spx:
    image: ghcr.io/nedix/spx-container:8.2
    volumes:
      - app:/var/www/html
    depends_on:
      - nginx-spx

volumes:
  app:
    driver: local
    driver_opts:
      device: ${PWD}
      o: bind
      type: none
```

## Usage

#### Start the services

```shell
docker compose -f docker-compose.yml -f docker-compose-spx.yml up -d
```

#### Capture a profiling report

Navigate to any page on http://127.0.0.1:81 to capture the profiling report.

#### Get insight into performance

Navigate to the [SPX] web interface on http://127.0.0.1:81/?SPX_UI_URI=/&SPX_KEY=dev.

<hr>

## Attribution

Powered by [SPX].

[SPX]: https://github.com/NoiseByNorthwest/php-spx
