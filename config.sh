#!bin/bash

# Is necessary docker installed
echo "Write url gitlab: "
URL_GITLAB=$1
echo "Write token gitlab: "
TOKEN=$2

docker run -d --name gitlab-runner --restart always -v /var/run/docker.sock:/var/run/docker.sock -v gitlab-runner-config:/etc/gitlab-runner gitlab/gitlab-runner:latest

echo $URL_GITLAB > $URL_GITLAB
echo $TOKEN > $TOKEN

docker run --rm -it -v gitlab-runner-config:./gitlab-runner-config gitlab/gitlab-runner restart

