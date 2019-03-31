### Korzystamy z Azure Cloud Shell lub z [shell.azure.com](http://shell.azure.com/)


##### pierwsza wersja statycznej aplikacji 

> git clone https://github.com/Azure-Samples/html-docs-hello-world.git 

###### zmiana katalogu 
> cd html-docs-hello-world/

###### ustawienie domyslnej lokalizacji
> az configure --defaults location=northeurope

###### utworzenie aplikacji  
> az webapp up --name mystaticapp2019 --sku S1

###### zmiana kodu 
> code index.html 

###### aktualizacja kodu 
az webapp up --name mystaticapp2019 --sku S1
