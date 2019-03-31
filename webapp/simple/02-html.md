### Korzystamy z Azure Cloud Shell lub z [shell.azure.com](http://shell.azure.com/)


##### pierwsza wersja statycznej aplikacji 

> git clone https://github.com/Azure-Samples/html-docs-hello-world.git 

###### zmiana katalogu 
> cd html-docs-hello-world/

###### ustawienie domyslnej lokalizacji
> az configure --defaults location=northeurope

###### utworzenie aplikacji  
> az webapp up --name mystaticapp2019 --sku F1

###### zmiana kodu 
> code index.html 

###### aktualizacja kodu 
> az webapp up --name mystaticapp2019 --sku F1


> {
>   "app_url": "http://mystaticapp2019.azurewebsites.net",

>   "location": "northeurope",

>   "name": "mystaticapp2019",

>   "os": "Windows",

>  "resourcegroup": "appsvc_rg_Windows_northeurope",

>   "serverfarm": "appsvc_asp_Windows_northeurope",

>   "sku": "FREE",

>   "src_path": "/home/krzysztof/html-docs-hello-world",

>   "version_detected": "-",

>   "version_to_create": "-"

> }
