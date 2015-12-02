# kauden/nginx

This is a Ubuntu-based image with nginx 1.6.2 installed.

It's pre-configured to listen on port 80 and 443.

## Usage

This is really meant to be used for building new docker images with your nginx app.

### Build

```bash
$ docker build -t <repo name>.
```

### Run in foreground

```bash
$ docker run kauden/nginx
```

### Run in background

```bash
$ docker run -d kauden/nginx
```

## Vomule

* /etc/nginx/conf.d
* /etc/nginx/sites-enabled
* /var/log/nginx

## Exposed ports

* 80
* 443