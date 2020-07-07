# Notes
1. Deploy development version locally using `docker`:
    1. Clone polisServer from [github](https://github.com/pol-is/polisServer) (`git clone https://github.com/pol-is/polisServer`).
    1. [Install docker](https://docs.docker.com/get-docker/) if necessary.
    1. Build and launch the polis server: `cd polisServer; docker-compose up`. (Note: this can take 10-15 minutes on a newer laptop with cable internet.)
    1. Visit [http://localhost:8000](http://localhost:8000).
1. Deploy development version on a cloud provider: 
    1. Follow [instructions](https://docs.docker.com/machine/get-started-cloud/) to create a remote docker machine. (There are [many](https://docs.docker.com/machine/drivers/) host options.)
    1. For AWS:
        1. If necessary, follow instructions at [docker.com](https://docs.docker.com/machine/examples/aws/) to sign up for AWS,  configure credentials, create an AWS account and create an AWS credential file. 
        2. Create docker machine: `docker-machine create --driver amazonec2 --amazonec2-open-port 5000 --amazonec2-region us-east-2 remote-polis`. This one is called `remote-polis`. 
    1. Connect your shell to the docker machine: `eval "$(docker-machine env remote-polis)"` 
    1. Build and launch the polis server on the remote docker machine: `cd polisServer; docker-compose up`. (Note: the build took ~10 minutes on a default aws machine.)
    1. Find the IP address of the docker machine: 
```
NAME          ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER      ERRORS
remote-polis  *        amazonec2    Running   tcp://A.BB.CCC.DDD:EEEE             v19.03.12
```
    1. Visit port 5000 of the ip address shown. E.g. http://A.BB.CCC.DDD:5000. 
    1. Useful commands for a remote docker machine:
        1. `docker-machine ls` to see a list of available “machines”.
        2. `docker-machine start <name>` 
        3. `docker-machine stop <name>`
        4. `docker-machine ssh <name>` to open an SSH session to the specified instance.
        5. `docker-machine rm <name>` permanently remove instance. 
    1. Remember to stop (`docker-machine stop <name>`) and delete (`docker-machine stop <name>`) remote instance to avoid unwanted charges.

1. https implementation:
    1. https://nodejs.org/en/knowledge/HTTP/servers/how-to-create-a-HTTPS-server/
    2. https://www.digitalocean.com/community/tutorials/how-to-secure-a-containerized-node-js-application-with-nginx-let-s-encrypt-and-docker-compose
    3. https://github.com/pol-is/polisServer/issues/289

# EXTRA
1. Deploy on a local docker machine. The steps below should work on OS X and linux. Please see the [docker-machine documentation](https://docs.docker.com/machine/get-started/) for more details regarding Windows.
    1. [Install virtualbox](https://www.virtualbox.org/wiki/Downloads) if necessary.
    1. Create a new local docker machine if necessary: `docker-machine create --driver virtualbox default`. This one is named `default`.
    1. Connect your shell to the docker machine: `eval "$(docker-machine env default)"`
    1. Build and launch the polis server on the second docker machine: `cd polisServer; docker-compose up`. (Note: this is a second build and will take another 10-15 minutes on a newer laptop with cable internet.)


1. Links of interest:
    1. https://docs.docker.com/compose/production/
    1. https://docs.docker.com/machine/examples/aws/
    1. https://www.google.com/search?q=docker+machine+fargate&oq=docker+machine+fargate
    1. https://docs.docker.com/engine/swarm/swarm-tutorial/
    2. https://kubernetes.io/docs/tasks/configure-pod-container/translate-compose-kubernetes/
    3. https://www.google.com/search?q=kubernetes+fargate&oq=kubernetes+fargate
    3. 