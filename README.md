This is a docker file for Xodx a node for the Distributed Semantic Social Network (DSSN)

You can find more information about Xodx at:

  * [github](https://github.com/AKSW/xodx)
  * [AKSW Project page](http://aksw.org/Project/Xodx)
  * [demo](http://xodx.comiles.eu/)

create with

    docker build -t xodx .

run with

    docker run -t -i -p 8080:80 xodx

or

    docker run -b -p 8080:80 xodx

Run as a user, which is in the docker group or with `sudo`.
