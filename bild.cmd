@Echo Off
java -Xmx9000M -jar mkgmap.jar -c osm.args 6324.typ *.osm.pbf
taskkill /f /t /im BaseCamp.exe
timeout 2
COPY C:\mkgmap\gmapsupp.img  H:\Garmin\
cd  "C:\Program Files (x86)\Garmin\BaseCamp\"
Start BaseCamp.exe
exit