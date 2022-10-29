@Echo Off
move E:\Загрузки\central-fed-district.osm.pbf  C:\splitter
cd C:\splitter\
java -Xmx9000m -jar splitter.jar --output=pbf --output-dir=splitter --max-nodes=1400000 --mapid=63221001 --geonames-file=cities15000.txt --polygon-file=central-fed-district.poly central-fed-district-latest.osm.pbf
move C:\splitter\splitter\*.pdf C:\mkgmap
cd C:\mkgmap
java -Xmx9000M -jar mkgmap.jar -c osm.args 6324.typ *.osm.pbf
COPY C:\mkgmap\gmapsupp.img  H:\Garmin\
exit