# Zoneminder in a Docker container
This is an attemp to bring Zoneminder in a Docker container, using the instructions from the [documentation](https://zoneminder.readthedocs.io/en/latest/installationguide/ubuntu.html), and using the [script provided by Andrew Bauer](https://github.com/ZoneMinder/zmdockerfiles/blob/master/utils/entrypoint.sh), in order to get the 1.36 and 1.37 version, in my own way, and available at GitHub Container Registry.

## Usage

1.36
```
docker run -d -p 8080:80 --name zoneminder ghcr.io/amitie10g/zoneminder:latest
```

1.37
```
docker run -d -p 8080:80 --name zoneminder ghcr.io/amitie10g/zoneminder:1.37
```

Then, go to http://localhost:8080/zm (or the address of the server).

**Note:** Volumes are already defined at Dockerfile (anonymous volumes), so you don't want and shouldn't declate them explicitly. You may want to set the Docker volumes directory to be store in a large (ideally compressed) volume.

Tested in both [Docker](https://www.docker.com/) and [Podman](https://podman.io/).

## Licensing
Everything in this repo but the scriot by Andrew Bauer is released into the Public domain (the Unlicense).
