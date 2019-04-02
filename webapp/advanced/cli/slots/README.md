###### logowanie, nie wymagane w Azure Cloud Shell

> az login

> AZURE_GROUP=rg-web-app

> AZURE_LOCATION=northeurope

> az configure --defaults group=$AZURE_GROUP
> az configure --defaults location=$AZURE_LOCATION


###### utworzenie nowej RG

> az group create --name $AZURE_GROUP 


AZURE_APPNAME=myAppServicePlanforWebApp2019
AZURE_WEBNAME=myWebApp2019forDemo

###### utworzenie App Service Plan
> az appservice plan create --name $AZURE_APPNAME --resource-group  $AZURE_GROUP --sku S1 ##--is-linux

###### utworzenie WebAppp w ramach App Service Plan


> az webapp create --resource-group $AZURE_GROUP --plan $AZURE_APPNAME --name $AZURE_WEBNAME \

>  --runtime 'PHP|7.0' 
  
###### dowiazanie kodu aplikacji z repozytorium na Githubie

> az webapp deployment source config --name $AZURE_WEBNAME --resource-group $AZURE_GROUP \

>  --repo-url https://github.com/djkormo/simple-chess-ai --branch master --manual-integration


###### utworzenie slotow
> az webapp deployment slot create --name $AZURE_WEBNAME --resource-group $AZURE_GROUP --slot DEV
> az webapp deployment slot create --name $AZURE_WEBNAME --resource-group $AZURE_GROUP --slot UAT



###### powiązanie slotow  ze zrodlem  na Githubie
> az webapp deployment source config --name $AZURE_WEBNAME --resource-group $AZURE_GROUP --slot DEV \
--repo-url https://github.com/Azure-Samples/php-docs-hello-world --branch master --manual-integration

> az webapp deployment source config --name $AZURE_WEBNAME --resource-group $AZURE_GROUP --slot UAT \
--repo-url https://github.com/aws-samples/aws-demo-php-simple-app --branch master --manual-integration






