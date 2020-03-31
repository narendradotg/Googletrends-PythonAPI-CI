cd jenkins
docker image build -t jenkins-docker .
docker container run -d -p 8080:8080 --name=jenkins-master -v /var/run/docker.sock:/var/run/docker.sock jenkins-docker
echo "Waiting to get password ..."
sleep 60
echo "Access jenkins as http://<host>:8080/, username as admin"
echo "PASSWORD"
docker exec -it jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword
