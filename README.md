# [spx-container][project]

Web GUI to display flame graphs for requests to a PHP application.

<img width="1511" alt="Screenshot at Oct 17 02-10-36" src="https://github.com/user-attachments/assets/3f935f95-c993-4434-9b6f-c3632cf8aa37">


## Usage

The following example expects that you have your main application services defined in `compose.yml`. It will listen for requests on port `81`.


### 1. Create the Compose manifest

```shell
wget -O compose-spx.yml https://raw.githubusercontent.com/nedix/spx-container/main/docs/examples/compose.yml
```


### 2. Start the services

```shell
docker compose -f compose.yml -f compose-spx.yml up -d
```


### 3. Capture a profiling report

Navigate to the page you would like to get measurements for on http://127.0.0.1:81 to capture a profiling report.


### 4. Get insight into performance metrics

Navigate to the SPX web interface on http://127.0.0.1:81/?SPX_UI_URI=/&SPX_KEY=dev.


[project]: https://hub.docker.com/r/nedix/spx
