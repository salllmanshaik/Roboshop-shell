component=catalogue
source common.sh

print_head Copy MongoDB Repo file
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>$log_file
exit_status_print $?

nodejs_app_setup


print_head Install MongoDB
dnf install mongodb-mongosh -y &>>$log_file
exit_status_print $?

print_head Load Master Data
mongosh --host mongo-dev.rdevopsb83.online </app/db/master-data.js &>>$log_file
exit_status_print $?
