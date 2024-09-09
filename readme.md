# My GNS3 LAB

## Run a simple web server

    docker build -f webserver.Dockerfile -t harimbolasantatra/some-server .

To run it on external container (w/o gns3):

    docker run --name some-server -d harimbolasantatra/some-server
