# sprlng.de - homepage

[![pipeline status](https://gitlab.com/alexandersperling/sprlng.de/badges/master/pipeline.svg)](https://gitlab.com/alexandersperling/sprlng.de/commits/master)

source code of my own homepage available [here](https://sprlng.de)

consists mainly of HTML and CSS

to run it locally build the docker image and start it like the following

```bash
docker build -t homepage .
```

```bash
docker run -d -p 80:80 -v /PATH/TO/REPO/:/var/www/homepage homepage
```
