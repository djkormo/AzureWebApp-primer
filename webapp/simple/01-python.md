### Korzystamy z Azure Cloud Shell lub z shell.azure.com


#### pierwsza wersja aplikacji www w pythonie 

> git clone https://github.com/Azure-Samples/python-docs-hello-world

> cd python-docs-hello-world/
> az configure --defaults location=northeurope
> # utworzenie aplikacji 
> az webapp up -n mypythoon2019 --sku S1
> # zmiana kodu 
> code application.py
> # ponowny deployment 
> az webapp up -n mypythoon2019