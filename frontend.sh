source common.sh

print_head Disable Default Nginx
dnf module disable nginx -y &>>$log_file
exit_status_print $?

print_head Enable Nginx 24
dnf module enable nginx:1.24 -y &>>$log_file
exit_status_print $?

print_head Install Nginx
dnf install nginx -y &>>$log_file
exit_status_print $?

print_head Copy Nginx Config file
cp nginx.conf /etc/nginx/nginx.conf &>>$log_file
exit_status_print $?

print_head Clean Old Content
rm -rf /usr/share/nginx/html/* &>>$log_file
exit_status_print $?

print_head Download App content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>>$log_file
exit_status_print $?

cd /usr/share/nginx/html

print_head Extract app content
unzip /tmp/frontend.zip &>>$log_file
exit_status_print $?

print_head Start Nginx Service
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file
exit_status_print $?