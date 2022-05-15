# Hello Docker - Httpd

Host a website in the httpd container 

The official guidance 

- [Httpd - Official Image | Docker Hub](https://hub.docker.com/_/httpd)
- [How to Serve PHP Websites Locally using Docker and Apache - YouTube](https://www.youtube.com/watch?v=aAwBSuldn_U&t=262s)

## Static Website 

### Create a Dockerfle 

```
FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
```

Then build and run the Docker image 

```
docker build -t my-apache2 .
docker run -dit --rm --name my-running-app -p 8080:80 my-apache2
```

In build, `-t` is the tag 

In run, `-dit` means daemon, `-i` means interative, `-t` means `tty` (terminal) , `--name` gives the container a name, 

`-p` will connect the local port 8080 to port 80 inside of the container. 

To check whether our server is running, type `localhost:8080` in the browser. 

### Without a Dockerfile 

```
docker run -dit --name my-apache-app -p 8080:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd:2.4
```

`-v` means volume, it has the syntax `-v src:dst` 

You may be more familiar with Nginx 

```
docker run -d -P \
    --name web \
    # -v /src/webapp:/usr/share/nginx/html \
    --mount type=bind,source=/src/webapp,target=/usr/share/nginx/html \
    nginx:alpine
```

The Nginx webserver will load the HTML files in directory `/usr/share/nginx/html` in the docker container, then host the web application. Similar things in the Apache server. 

From the PHP docker guidance, https://hub.docker.com/_/php

### The default DocumentRoot 

We can change the Apache configuration (``DocumentRoot``) 

```
FROM php:7.1-apache

ENV APACHE_DOCUMENT_ROOT /path/to/new/root

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
```

It will replace the all `/var/www/html` or `/var/www` to `APACHE_DOCUMENT_ROOT`. 

