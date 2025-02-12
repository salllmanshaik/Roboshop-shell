dnf module disable redis -y
dnf module enable redis:7 -y

dnf install redis -y

sed -i 's|127.0.0.1|0.0.0.0' /etc/redis/redis.conf

sed -i -e '/protected-mode/ c protected-mode no' /etc/redis/redis.conf

systemctl enable redis
systemctl start redis