#### Utworzenie aplikacji wordpress z poziomu CLI



###### logowanie , nie jest wymagane z poziomu Azure Cloud Shell 

> az login

> AZURE_GROUP=rg-web-app

> AZURE_LOCATION=northeurope


> az configure --defaults group=$AZURE_GROUP

> az configure --defaults location=$AZURE_LOCATION


###### utworzenie nowej RG

> az group create --name $AZURE_GROUP 

> AZURE_APPNAME=myAppServicePlanforWebApp2019

> AZURE_WEBNAME=myWebApp2019forDemo

###### utworzenie App Service Plan

> az appservice plan create --name $AZURE_APPNAME --resource-group  $AZURE_GROUP --sku S1 

###### utworzenie WebAppp w ramach App Service Plan


> az webapp create --resource-group $AZURE_GROUP --plan $AZURE_APPNAME --name $AZURE_WEBNAME \

>  --runtime 'PHP|7.0' 
  
###### dowiazanie kodu aplikacji z repozytorium na Githubie

> az webapp deployment source config --name $AZURE_WEBNAME --resource-group $AZURE_GROUP \

>  --repo-url https://github.com/djkormo/wordpressfiles--branch master --manual-integration


###### Utworzenie bazy Danych

> AZURE_MYSQLSERVER=mysqlserver2019forwebapp

> AZURE_MYSQLDATABASE=wordpress 

###### utworzenie serwera mysql, koniecznie nalezy zmienic hasło (--admin-password)

> az mysql server create --resource-group $AZURE_GROUP \

>  --name $AZURE_MYSQLSERVER  --location $AZURE_LOCATION --admin-user myadmin \

>  --admin-password Pa55word57, --sku-name B_Gen5_2 --version 5.7


###### utworzenie bazy mysql ....

> az mysql db create -g $AZURE_GROUP -s $AZURE_MYSQLSERVER -n $AZURE_MYSQLDATABASE

###### ustawienie reguły firewalla

> az mysql server firewall-rule create -g $AZURE_GROUP  -s $AZURE_MYSQLSERVER \

> -n allowip --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255




###### z poziomu Azure Cloud Shell 


> mysql -h mysqlserver2019forwebapp.mysql.database.azure.com -u myadmin@mysqlserver2019forwebapp -p

> /* drop database if exists wordpress; */ 

> create user 'wordpress' IDENTIFIED BY "WP-Passw0rd"; 

> create database wordpress; 

> GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'; 

> FLUSH PRIVILEGES;


###### Fragment konfiguracji pliku wp-config.php :

> define('DB_NAME', getenv('WORDPRESS_DB_NAME')); 

> define('DB_USER', getenv('WORDPRESS_DB_USER')); 

> define('DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD')); 

> define('DB_HOST', getenv('WORDPRESS_DB_HOST'));


az webapp config appsettings set -g $AZURE_GROUP -n $AZURE_APPNAME \
  --settings WORDPRESS_DB_NAME=wordpress

az webapp config appsettings set -g $AZURE_GROUP -n $AZURE_APPNAME \
  --settings WORDPRESS_DB_USER=wordpress@mysqlserver2019forwebapp

az webapp config appsettings set -g $AZURE_GROUP -n $AZURE_APPNAME \
  --settings WORDPRESS_DB_PASSWORD=WP-Passw0rd

az webapp config appsettings set -g $AZURE_GROUP -n $AZURE_APPNAME \
  --settings WORDPRESS_DB_HOST=mysqlserver2019forwebapp.mysql.database.azure.com




