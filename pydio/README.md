# kauden/nginx

This is a Centos base image with pydio 6.0.5 installed.

It's pre-configured to listen on port 80.

## Usage

This is really meant to be used for building new docker images with your pydio app.

### Build

```bash
$ docker build -t <repo name> .
```

### Run in foreground

```bash
$ docker run kauden/pydio
```

### Run in background

```bash
$ docker run -d kauden/pydio
```

## Exposed ports

* 80
