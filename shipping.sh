component = shipping
source common.sh


dnf install mysql -y

mysql -h mysql-dev.salman06.shop -uroot -pRoboShop@1 < /app/db/schema.sql

mysql -h mysql-dev.salman06.shop -uroot -pRoboShop@1 < /app/db/app-user.sql

mysql -h mysql-dev.salman06.shop -uroot -pRoboShop@1 < /app/db/master-data.sql



