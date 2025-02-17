print_head Disable Default Nginx
dnf module disable nginx -y &>> $log_file

print_head Enable Nginx 24
dnf module enable nginx:1.24 -y &>> $log_file

print_head Install Nginx
dnf install nginx -y &>> $log_file

print_head Copy Nginx configuration file
cp nginx.conf  /etc/nginx/nginx.conf &>> $log_file

print_head clean old content
rm -rf /usr/share/nginx/html/* &>> $log_file

print_head download app content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>> $log_file
cd /usr/share/nginx/html

print_head Extract app content
unzip /tmp/frontend.zip &>> $log_file &>> $log_file

print_head Enable Nginx service
systemctl enable nginx &>> $log_file

print_head Start Nginx service
systemctl start nginx &>> $log_file