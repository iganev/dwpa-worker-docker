# RealEnder/dwpa worker for Docker

## About

This is a docker setup to automatically run a worker instance for RealEnder's dwpa inside a Debian Stretch container.

Source files `help_crack.py` and `help_crack.py.version` are directly copied from [RealEnder/dwpa](https://github.com/RealEnder/dwpa).

The file `Dockerfile` describes how to create the image correctly.

The files `start.sh`, `stop.sh` and `show.sh` are utility scripts used in the container.

 - `start.sh` is the docker entry point that starts the worker and stays alive while the worker process is active.
 - `stop.sh` can be used by the user to *gently* shutdown the worker while inside the container.
 - `show.sh` can be used by the user to re-attach the screen session the worker is running into. Use *CTRL + A* and *CTRL + D* to detach safely afterwards.

## Disclaimer 

I don't know and I don't care how and why are you going to use this docker image. The code here is provided *as-is* and no support should be expected. The content of `help_crack.py` and `help_crack.py.version` are the product of work of [RealEnder](https://github.com/RealEnder) and I do not claim any credit or responsibility of them. These files are distributed under GNU GPL v3 license.

## How to use

To create the docker image simply go in the project directory and run:


```

docker image build -t dwpa_worker:latest .

```

To launch a container with your newly created docker image run:

```

docker container run --detach --name dwpa_worker dwpa_worker:latest

```

To make sure your docker container is doing well run:

```

docker ps

```

and look for `dwpa_worker` container that should be running `./start.sh`.

To poke around the container and/or debug any issues run:

```

docker exec -it <container id> bash

```

Where `<container id>` is the container id discovered when running `docker ps`.

Once inside the container you can `./show.sh` to see what's the worker been up to or `./stop.sh` to *gently* terminate the worker and thus the container.

## Configuration

For any configuration refer to the original documentation at [RealEnder/dwpa](https://github.com/RealEnder/dwpa). 
