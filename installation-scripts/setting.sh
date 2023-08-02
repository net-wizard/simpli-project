#!/bin/bash
# installing ansible plugin
pass=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
url=$(curl api.ipify.org)

wget http://$url:8080/jnlpJars/jenkins-cli.jar
echo "#######################################################"
echo "Jenkins default password: " $pass
echo "#######################################################"
java -jar jenkins-cli.jar -s http://$url:8080/ -auth admin:$pass install-plugin ansible
sudo systemctl restart jenkins