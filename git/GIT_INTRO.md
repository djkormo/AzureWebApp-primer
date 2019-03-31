##### Na podstawie https://git-scm.com/book/pl/v1/Pierwsze-kroki

[logo]: https://github.com/djkormo/primer-tutorials/blob/master/git/logo%402x.png "Logo Git"

### Podstawowe polecenia git

#### Uzyskanie pomocy (trzy sposoby)

> git help <polecenie>
> git <polecenie> --help
> man git-<polecenie>


Po utworzeniu konta na github.com

Zakładamy pierwsze repozytorium

#### Tworzenie pustego repozytorium


> git config --global user.name "Twoje imię i nazwsko"
>
> git config --global user.email email@poczta.com
>
> git init

#### dodanie zdalnego repozytorium  o nazwie origin 

> git remote add origin  https://github.com/djkormo/test.git


#### Sprawdzenie konfiguracji zdalnego repozytorium 

>git remote -v


#### Dodanie wszystkich plików danedo katalogu do repozytorium kodu:

> git add *

#### Dodanie pliku z biezacego katalogu o nazwie nazwa-pliku do repozytorium kodu


> git add nazwa-pliku


#### Do zatwierdzania zmian w repozytorium git’a służy polecenie commit :

>  git commit -m 'nazwa commita'


#### Wysłanie zmian na serwer

> git push twoja-nazwa master

#### Pobranie zmian z serwera

> git pull twoja-nazwa

#### historia zmian

> git log

#### Historia  ostarnich 2 zmian z porownaniem

> git log -p -2


#### Status spojnosci repozytorium

> git status





