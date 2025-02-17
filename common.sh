

artifact_download(){
  rm -rf /app
  mkdir /app
  curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip
  cd /app
  unzip /tmp/user.zip
}


systemd_setup(){
  systemctl daemon-reload
  systemctl enable user
  systemctl restart user
}

app_prereq(){
    useradd roboshop
    cp $component.service /etc/systemd/system/$component.service
}


nodejs_app_setup(){
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
  app_prereq
  artifact_download
  cd /app
  npm install
  systemd_setup
}


maven_app_setup(){
  dnf install maven -y
  app_prereq
  artifact_download
  cd /app
  mvn clean package
  mv target/shipping-1.0.jar shipping.jar
  systemd_setup
}


python_app_setup(){
  dnf install python3 gcc python3-devel -y
  app_prereq
  artifact_download
  cd /app
  pip3 install -r requirements.txt
  systemd_setup
}


