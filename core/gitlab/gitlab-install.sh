#Find first root login password
#docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password

docker run --detach \
--publish 443:443 --publish 80:80 --publish 1001:22 \
--name gitlab \
--restart always \
--volume $GITLAB_HOME/conf:/etc/gitlab \
--volume $GITLAB_HOME/log:/var/log/gitlab \
--volume $GITLAB_HOME/data:/var/opt/gitlab \
--shm-size 512m \
gitlab/gitlab-ce:18.8.2-ce.0
