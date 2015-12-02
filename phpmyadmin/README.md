# kauden/phpmyadmin

This is a Ubuntu-based image with nginx, php-fpm and phpmyadmin installed.

It's pre-configured to listen on port 80 and 443.

## Usage

This is really meant to be used for building new docker images with your nginx, php-fpm and phpmyadmin app.

### Build

```bash
$ docker build -t <repo name> .
```

### Run in foreground

```bash
$ docker run kauden/phpmyadmin
```

### Run in background

```bash
$ docker run -d kauden/phpmyadmin
```

## Exposed ports

* 80
* 443