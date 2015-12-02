# kauden/nginx-fpm

This is a Ubuntu-based image with nginx and php-fpm installed.

It's pre-configured to listen on port 80.

## Usage

This is really meant to be used for building new docker images with your nginx and php-fpm app.

### Build

```bash
$ docker build -t <repo name> .
```

### Run in foreground

```bash
$ docker run kauden/nginx-fpm
```

### Run in background

```bash
$ docker run -d kauden/nginx-fpm
```

## Exposed ports

* 80