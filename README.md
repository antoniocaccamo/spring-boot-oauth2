# spring-boot-oauth2


## Docker 



1. docker swarm init
2. docker stack deploy -c docker-compose.yml oauth2-lab
```
docker stack ls                                            # List stacks or apps
docker swarm init                                          # init swarm app
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker service ls                 # List running services associated with an app
docker service ps <service>                  # List tasks associated with an app
docker inspect <task or container>                   # Inspect task or container
docker container ls -q                                      # List container IDs
docker stack rm <appname>                             # Tear down an application
docker swarm leave --force      # Take down a single node swarm from the manager
```