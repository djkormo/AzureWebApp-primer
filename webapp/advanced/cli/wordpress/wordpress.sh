# zmienne konfiguracyjne
RND=$RANDOM
AZURE_GROUP=rg-web-app
AZURE_LOCATION=northeurope

AZURE_APPNAME=myAppServicePlanforWebApp2019$RND
AZURE_WEBNAME=myWebApp2019forDemo$RND

AZURE_MYSQLSERVER=mysqlserver2019forwebapp$RND
AZURE_MYSQLDATABASE=wordpress 

az configure --defaults group=$AZURE_GROUP

az configure --defaults location=$AZURE_LOCATION


# utworzenie nowej RG

az group create --name $AZURE_GROUP 



# utworzenie App Service Plan

az appservice plan create --name $AZURE_APPNAME --resource-group  $AZURE_GROUP --sku S1 

# utworzenie WebAppp w ramach App Service Plan

az webapp create --resource-group $AZURE_GROUP --plan $AZURE_APPNAME --name $AZURE_WEBNAME  --runtime 'PHP|7.0' 
  
# dowiazanie kodu aplikacji z repozytorium na Githubie

az webapp deployment source config --name $AZURE_WEBNAME --resource-group $AZURE_GROUP   \
  --repo-url https://github.com/djkormo/wordpressfiles --branch master --manual-integration


# Utworzenie bazy Danych

# utworzenie serwera mysql, koniecznie nalezy zmienic hasło (--admin-password)

az mysql server create --resource-group $AZURE_GROUP \
  --name $AZURE_MYSQLSERVER  --location $AZURE_LOCATION --admin-user myadmin \
  --admin-password Pa55word57, --sku-name B_Gen5_2 --version 5.7


# utworzenie bazy mysql ....

az mysql db create -g $AZURE_GROUP -s $AZURE_MYSQLSERVER -n $AZURE_MYSQLDATABASE

# ustawienie reguły firewalla

az mysql server firewall-rule create -g $AZURE_GROUP  -s $AZURE_MYSQLSERVER \
   -n allowip --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255
   
   
# uzupelnienie konfiguracji aplikacji do polączenia z bazą danych    
az webapp config appsettings set -g $AZURE_GROUP -n $AZURE_WEBNAME \
--settings WORDPRESS_DB_NAME=wordpress

az webapp config appsettings set -g $AZURE_GROUP -n $AZURE_WEBNAME \
--settings WORDPRESS_DB_USER=wordpress@$AZURE_MYSQLSERVER

az webapp config appsettings set -g $AZURE_GROUP -n $AZURE_WEBNAME \
--settings WORDPRESS_DB_PASSWORD=WP-Passw0rd

az webapp config appsettings set -g $AZURE_GROUP -n $AZURE_WEBNAME \
--settings WORDPRESS_DB_HOST=$AZURE_MYSQLSERVER.mysql.database.azure.com

   
mysql -h $AZURE_MYSQLSERVER.mysql.database.azure.com -u myadmin@$AZURE_MYSQLSERVER -p  <mysql.sql 
   
