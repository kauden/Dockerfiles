# kauden/nginx-passenger

This is a Ubuntu-based image with nginx-passenger installed.

It's pre-configured to listen on port 80.

## Usage

This is really meant to be used for building new docker images with your nginx-passenger app.

### Build

```bash
$ docker build -t <repo name> .
```

### Run in foreground

```bash
$ docker run kauden/nginx-passenger
```

### Run in background

```bash
$ docker run -d kauden/nginx-passenger
```

## Exposed ports

* 80