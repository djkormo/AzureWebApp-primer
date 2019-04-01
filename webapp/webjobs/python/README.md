#### Na podstawie https://medium.com/@panan_songyu/how-to-write-a-azure-web-job-role-by-python-and-get-it-running-7e6560634430

Plik webjob.py

> ###### encoding:utf-8
> import sys
> reload(sys)
> sys.setdefaultencoding('utf8')
>
> sitepackage = "D:\home\site\wwwroot\env\Lib\site-packages"
> sys.path.append(sitepackage)

> ###### logika 

> print ('Hello from Webjob in Python')


