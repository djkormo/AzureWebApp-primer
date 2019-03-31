
##### proba uruchomienia statycznej strony 

###### pobieramy kod z repozytorium
> git clone https://github.com/djkormo/simple-chess-ai.git

###### zmiana katalogu 
> cd simple-chess-ai 


###### ustawienie domyslnej lokalizacji
> az configure --defaults location=northeurope

###### utworzenie aplikacji  
> az webapp up -n mychess2019 --sku B1

##### Logi 

> Resource group 'appsvc_rg_Linux_northeurope' already exists.

> Creating App service plan 'appsvc_asp_Linux_northeurope' ...

> App service plan creation complete

> Creating app 'mychess2019' ....

> Webapp creation complete

> Updating app settings to enable build after deployment

> Creating zip with contents of dir /home/krzysztof/simple-chess-ai ...

> Preparing to deploy and build contents to app.This operation can take a while to complete ...

> Getting scm site credentials for zip deployment

> Starting zip deployment


> All done.

> {

>   "app_url": "http://mychess2019.azurewebsites.net",

>   "location": "northeurope",

>   "name": "mychess2019",

>   "os": "Linux",

>   "resourcegroup": "appsvc_rg_Linux_northeurope",

>   "serverfarm": "appsvc_asp_Linux_northeurope",

>   "sku": "BASIC",

>   "src_path": "/home/krzysztof/simple-chess-ai",

>   "version_detected": "0.0",

>   "version_to_create": "node|8.11"

> }