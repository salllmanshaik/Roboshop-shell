dnf module disable nodejs -y
dnf module enable nodejs:20 -y

dnf install nodejs -y

cp cart.service /etc/systemd/system/cart.service

useradd roboshop

mkdir /app

curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip
cd /app
unzip /tmp/cart.zip

cd /app
npm install -g npm@11.1.0

systemctl daemon-reload

systemctl enable cart
systemctl restart cart