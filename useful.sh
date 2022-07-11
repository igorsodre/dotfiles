# clean docker env
docker system prune -a
docker volume prune
# alternative
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
