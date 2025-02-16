dnf install python3 gcc python3-devel -y

useradd roboshop

cp payment.service /etc/systemd/system/payment.service

rm -rf /app
mkdir /app

curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip
cd /app || exit
unzip /tmp/payment.zip

cd /app || exit
pip3 install -r requirements.txt

systemctl daemon-reload

systemctl enable payment
systemctl restart payment