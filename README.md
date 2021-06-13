# IO_nikodem_damian
Nikodem Wójciak, Damian Zierke

Wymagania systemowe:
⦁ Windows 10 Professional
⦁ 64 Bit machine
⦁ Visual Studio Community 2017 (with Microsoft .NET Framework version 4.7.03056)
⦁ MySQL Community Server 8.0.11
⦁ MySQL Connector/C++ version 8.0.11


1. Pobierz i zainstaluj MySQL Installer (https://dev.mysql.com/downloads/windo...)
2. Używając MySQL Installer zainstaluj:
 a. MySQL Community Server 8.0.11
 b. MySQL Connector/C++ version 8.0.11
3. W Visualu w eskploatorze rozwiązań klikamy na nasz projekt IO_implementacja prawym przyciskiem i dajemy "właściwości"
-przechodzimy do "C/C++" -> "ogólne". Dodajemy katalogi plików nagłówków:
 a. C:\Program Files\MySQL\Connector C++ 1.1\include
 b. C:\Program Files\MySQL\MySQL Server 8.0\include
-przechodzimy do "Konsolidator" -> "ogólne". Dodajemy "dodatkowe katalogi biblioteki":
 c. C:\Program Files\MySQL\Connector C++ 1.1\lib\opt
 d. C:\Program Files\MySQL\MySQL Server 8.0\lib
-przechodzimy do "Konsolidator" -> "Dane wejściowe". Dodajemy "dodatkowe zależności":
 e. mysqlcppconn.lib
 f. libmysql.lib
4. Przed uruchomieniem kodu
 a. Skopiuj libmysql.dll from C:\Program Files\MySQL\MySQL Server 8.0\lib 
  do folderu z projektem
 b. Skopiuj libcrypto-1_1-x64.dll and libssl-1_1-x64.dll z 
  C:\Program Files\MySQL\MySQL Server 8.0\bin do folderu z projektem
