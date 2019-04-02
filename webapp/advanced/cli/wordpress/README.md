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


# z poziomu Azure Cloud Shell 

> mysql –h mysqlforphp.mysql.database.azure.com  -u mysqladmin@mysqlforphp -p 

> /* drop database if exists wordpress; */ 

> create user 'wordpress' IDENTIFIED BY "WP-Passw0rd"; 

> create database wordpress; 

> GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'; 

> FLUSH PRIVILEGES;







