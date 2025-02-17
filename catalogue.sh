component=catalogue
source common.sh

cp mongo.repo /etc/yum.repos.d/mongo.repo

nodejs_app_setup



dnf install mongodb-mongosh -y

mongosh --host mongo-dev.salman06.shop </app/db/master-data.js


