#### Na podstawie https://blogs.msdn.microsoft.com/azureossds/2015/04/28/executing-java-web-jobs-on-azure


Pliki:

###### Hello.java
> public class Hello 
> {
> 
> 	public static void main(String[] args) 
> 	{
> 	  System.out.println("Hello Word!  WebJob on Azure!");
> 	}
> 
> }

###### run.bat
 
> set PATH=%PATH%;%JAVA_HOME%/bin
> java Hello

Plik zip zawiera : Hello.class oraz run.bat

