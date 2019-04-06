# zmienne konfiguracyjne

RND=$RANDOM

AZURE_GROUP=rg-web-app-auto
AZURE_LOCATION=northeurope
AZURE_APPNAME=myAppServicePlanforWebApp2019auto$RND
AZURE_WEBNAME=myWebApp2019forDemoauto$RND


# ustalenie domyslnej grupy 
az configure --defaults group=$AZURE_GROUP 
az configure --defaults location=$AZURE_LOCATION

# utworzenie nowej grupy 
az group create --name $AZURE_GROUP


# utworzenie planu app service 
az appservice plan create --name $AZURE_APPNAME --resource-group $AZURE_GROUP --sku S1 --is-linux 

# utworzenie planu app service 

az webapp create --resource-group $AZURE_GROUP --plan $AZURE_APPNAME --name $AZURE_WEBNAME \
--runtime 'PHP|7.0'

# powiazanie z kodem repozytorium Githuba

az webapp deployment source config --name $AZURE_WEBNAME --resource-group $AZURE_GROUP \
  --repo-url https://github.com/djkormo/simple-chess-ai --branch master --manual-integration

  # ustawienie wsstepnej konfiguracji skalowania 
az monitor autoscale create \
  --resource-group $AZURE_GROUP \
  --resource $AZURE_APPNAME \
  --resource-type Microsoft.Web/serverFarms \
  --name autoscale \
  --min-count 1 \
  --max-count 4 \
  --count 2 
  
# scale out

az monitor autoscale rule create \
  --resource-group $AZURE_GROUP \
  --resource $AZURE_APPNAME \
  --resource-type Microsoft.Web/serverFarms \
  --autoscale-name autoscale \
  --condition "CpuPercentage > 50 avg 5m" \
  --scale out 1  
  
  
  
 # scale in

 
 az monitor autoscale rule create \
  --resource-group $AZURE_GROUP \
  --resource $AZURE_APPNAME \
  --resource-type Microsoft.Web/serverFarms \
  --autoscale-name autoscale \
  --condition "CpuPercentage < 30 avg 5m" \
  --scale in 1  
 
# scale out

az monitor autoscale rule create \
  --resource-group $AZURE_GROUP \
  --resource $AZURE_APPNAME \
  --resource-type Microsoft.Web/serverFarms \
  --autoscale-name autoscale \
  --condition "MemoryPercentage > 50 avg 5m" \
  --scale out 1  
  

  
 # scale in

 
 az monitor autoscale rule create \
  --resource-group $AZURE_GROUP \
  --resource $AZURE_APPNAME \
  --resource-type Microsoft.Web/serverFarms \
  --autoscale-name autoscale \
  --condition "MemoryPercentage < 30 avg 5m" \
  --scale in 1   
  
  
  

 