

AZURE_GROUP=rg-web-app

AZURE_LOCATION=northeurope

az configure --defaults group=$AZURE_GROUP 
az configure --defaults location=$AZURE_LOCATION

AZURE_APPNAME=myAppServicePlanforWebApp2019


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
  --condition "Percentage CPU > 70 avg 5m" \
  --scale out 1
  
az monitor autoscale rule create  --resource-group $AZURE_GROUP   \
--resource mywebapp2019fordemo  \
--resource-type 'Microsoft.Web/sites' \
--autoscale-name autoscale    \
--condition "CPU Percentage  > 50 avg 5m"   \
--scale out 1


az monitor autoscale rule create  --resource-group $AZURE_GROUP   \
--resource mywebapp2019fordemo  \
--resource-type 'Microsoft.Web/sites' \
--autoscale-name autoscale    \
--condition "Percentage CPU < 50 avg 5m"   \
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
  --resource-group $AZURE_GROUP \
  --autoscale-name autoscale \
  --condition "Percentage CPU < 30 avg 5m" \
  --scale in 1