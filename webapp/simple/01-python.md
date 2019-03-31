### Korzystamy z Azure Cloud Shell lub z [shell.azure.com](http://shell.azure.com/)


##### pierwsza wersja aplikacji www w pythonie 

> git clone https://github.com/Azure-Samples/python-docs-hello-world
###### zmiana katalogu 
> cd python-docs-hello-world/

###### ustawienie domyslnej lokalizacji
> az configure --defaults location=northeurope

> ######  utworzenie aplikacji 
> az webapp up -n mypython2019 --sku S1


> Creating Resource group 'appsvc_rg_Linux_northeurope' ...

> Resource group creation complete

> Creating App service plan 'appsvc_asp_Linux_northeurope' ...

> App service plan creation complete

> Creating app 'mypython2019' ....

> Webapp creation complete

> Updating app settings to enable build after deployment

> Creating zip with contents of dir /home/krzysztof/python-docs-hello-world ...

> Preparing to deploy and build contents to app.This operation can take a while to complete ...

> Getting scm site credentials for zip deployment

> Starting zip deployment

> All done.

> {

>  "app_url": "http://mypython2019.azurewebsites.net",

> "location": "northeurope",

>  "name": "mypythoon2019",

>  "os": "Linux",

>  "resourcegroup": "appsvc_rg_Linux_northeurope",

>  "serverfarm": "appsvc_asp_Linux_northeurope",

>  "sku": "STANDARD",

>  "src_path": "/home/krzysztof/python-docs-hello-world",

>  "version_detected": "-",

>  "version_to_create": "python|3.7"

> }



> ######  zmiana kodu 
> code application.py

> ######  ponowny deployment 
> az webapp up -n mypython2019 --sku S1

> Resource group 'appsvc_rg_Linux_northeurope' already exists.

> App service plan 'appsvc_asp_Linux_northeurope' already exists.

> App 'mypython2019' already exists

> Updating app settings to enable build after deployment

> Creating zip with contents of dir /home/krzysztof/python-docs-hello-world ...

> Preparing to deploy and build contents to app.This operation can take a while to complete ...

> Getting scm site credentials for zip deployment

> Starting zip deployment

> All done.

