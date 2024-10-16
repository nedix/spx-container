# [spx-container](https://github.com/nedix/spx-container)

Web GUI that displays flame graphs of requests to a PHP application.

## Usage

#### 1. Create the Compose manifest

The example Compose manifest expects that you have your main application services defined in `compose.yml`. It will listen for requests on port `81`.

```shell
wget -q https://raw.githubusercontent.com/nedix/spx-container/main/docs/examples/compose-spx.yml
```

#### 2. Start the services

```shell
docker compose -f compose.yml -f compose-spx.yml up -d
```

#### 3. Capture a profiling report

Navigate to the page you would like to get measurements for on http://127.0.0.1:81 to capture a profiling report.

#### 4. Gain insight into performance metrics of your application

Navigate to the SPX web interface on http://127.0.0.1:81/?SPX_UI_URI=/&SPX_KEY=dev.

<hr>

## Attribution

Powered by [SPX].

[SPX]: https://github.com/NoiseByNorthwest/php-spx
