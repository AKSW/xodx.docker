create with

    docker build -t xodx .

run with

    docker run -t -i -p 8080:80 xodx

or

    docker run -b -p 8080:80 xodx

Run as a user, which is in the docker group or with `sudo`.
