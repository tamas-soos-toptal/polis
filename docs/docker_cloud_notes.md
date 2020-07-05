# Notes
1. Deploy locally using `docker`:
    1. Clone polisServer from [github](https://github.com/pol-is/polisServer) (`git clone https://github.com/pol-is/polisServer`).
    1. [Install docker](https://docs.docker.com/get-docker/) if necessary.
    1. Build and launch the polis server: `cd polisServer; docker-compose up`. (Note: this can take 10-15 minutes on a newer laptop with cable internet.)
    1. Visit [http://localhost:8000](http://localhost:8000).
1. Deploy on a local docker machine. The steps below should work on OS X and linux. Please see the [docker-machine documentation](https://docs.docker.com/machine/get-started/) for more details regarding Windows.
    1. [Install virtualbox](https://www.virtualbox.org/wiki/Downloads) if necessary.
    1. Create a new local docker machine if necessary: `docker-machine create --driver virtualbox default`. This one is named `default`.
    1. Connect your shell to the docker machine: `eval "$(docker-machine env default)"`
    1. Build and launch the polis server on the second docker machine: `cd polisServer; docker-compose up`. (Note: this is a second build and will take another 10-15 minutes on a newer laptop with cable internet.)
    1. Find the local IP address of the docker machine: 
```
$ docker-machine ls
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER      ERRORS
default   *        virtualbox   Running   tcp://192.168.99.100:2376           v19.03.12  
```
    1. Visit port 5000 of the ip address shown. E.g. http://192.168.99.100:5000. 
1. Deploy on a cloud provider: 
    1. https://docs.docker.com/compose/production/
    1. https://docs.docker.com/machine/examples/aws/
    1. https://www.google.com/search?q=docker+machine+fargate&oq=docker+machine+fargate
    1. https://docs.docker.com/engine/swarm/swarm-tutorial/
    2. https://kubernetes.io/docs/tasks/configure-pod-container/translate-compose-kubernetes/
    3. https://www.google.com/search?q=kubernetes+fargate&oq=kubernetes+fargate
    3. 