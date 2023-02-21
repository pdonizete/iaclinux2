FROM nginx

RUN apt-get update && apt-get install -y mysql-server && \
    echo "mysql-server mysql-server/root_password password senha123" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password senha123" | debconf-set-selections

RUN service mysql start && \
    mysql -u root -p"senha123" -e "CREATE DATABASE meubanco;"

VOLUME /var/lib/mysql

COPY nginx.conf /etc/nginx/nginx.conf
