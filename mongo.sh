source common.sh

print_head Copy MongoDB repo file
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>$log_file

print_head Install MongoDB
dnf install mongodb-org -y &>>$log_file

print_head Update MongoDb config file
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf &>>$log_file

print_head Start MongoDB Service
systemctl enable mongod &>>$log_file
systemctl restart mongod &>>$log_file
