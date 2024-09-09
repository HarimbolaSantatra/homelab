# My GNS3 LAB

## Run a simple web server

    docker run --name some-server -v webserver/:/usr/share/nginx/html:ro -d nginx
