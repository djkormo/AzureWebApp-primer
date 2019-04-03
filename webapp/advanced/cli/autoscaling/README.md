

AZURE_GROUP=rg-web-app

AZURE_LOCATION=northeurope

az configure --defaults group=$AZURE_GROUP 
az configure --defaults location=$AZURE_LOCATION

AZURE_APPNAME=myAppServicePlanforWebApp2019


AZURE_GROUP=rg-web-app

AZURE_LOCATION=northeurope

az configure --defaults group=$AZURE_GROUP az configure --defaults location=$AZURE_LOCATION

az group create --name $AZURE_GROUP

AZURE_APPNAME=myAppServicePlanforWebApp2019

AZURE_WEBNAME=myWebApp2019forDemo


az appservice plan create --name $AZURE_APPNAME --resource-group $AZURE_GROUP --sku S1


az webapp create --resource-group $AZURE_GROUP --plan $AZURE_APPNAME --name $AZURE_WEBNAME \
  --runtime 'PHP|7.0'


az webapp deployment source config --name $AZURE_WEBNAME --resource-group $AZURE_GROUP \
  --repo-url https://github.com/djkormo/simple-chess-ai --branch master --manual-integration

az monitor autoscale create \
  --resource-group $AZURE_GROUP \
  --resource $AZURE_APPNAME \
  --resource-type Microsoft.Web/serverFarms \
  --name autoscale \
  --min-count 1 \
  --max-count 4 \
  --count 2
  
#https://github.com/Azure/azure-cli/issues/8564

az monitor autoscale rule create \
  --resource-group $AZURE_GROUP \
  --resource $AZURE_APPNAME \
  --resource-type Microsoft.Web/serverFarms \
  --autoscale-name autoscale \
  --condition "CpuPercentage > 70 avg 5m" \
  --scale out 1
  
az monitor autoscale rule create  --resource-group $AZURE_GROUP   \
--resource $AZURE_WEBNAME  \
--resource-type 'Microsoft.Web/sites' \
--autoscale-name autoscale    \
--condition "CpuPercentage < 30 avg 5m"   \
--scale in 1  
  
  
az monitor autoscale rule create  --resource-group $AZURE_GROUP   \
--resource $AZURE_WEBNAME  \
--resource-type 'Microsoft.Web/sites' \
--autoscale-name autoscale    \
--condition "CpuPercentage  > 50 avg 5m"   \
--scale out 1


az monitor autoscale rule create  --resource-group $AZURE_GROUP   \
--resource $AZURE_WEBNAME  \
--resource-type 'Microsoft.Web/sites' \
--autoscale-name autoscale    \
--condition "CpuPercentage < 50 avg 5m"   \
--scale in 1

  
 

https://mywebapp2019fordemo.azurewebsites.net


 az monitor autoscale rule create  --resource-group $AZURE_GROUP   \
--resource mywebapp2019fordemo  \
--resource-type 'Microsoft.Web/sites' \
--autoscale-name autoscale    \
--condition "Requests >= 200 avg 5m"   \
--scale out 2

  
az monitor autoscale rule create  --resource-group $AZURE_GROUP   \
--resource $AZURE_APPNAME  \
--resource-type 'Microsoft.Web/serverFarms' \
--autoscale-name autoscale    \
--condition "Requests >= 200 avg 5m"   \
--scale out 2  
  
  
  
az monitor autoscale rule create \
--resource $AZURE_WEBNAME  \
--resource-type 'Microsoft.Web/sites' \
  --autoscale-name autoscale \
  --condition "Requests  < 100 avg 5m" \
  --scale in 1
  
  
  
az monitor autoscale rule list --autoscale-name autoscale  --resource-group $AZURE_GROUP