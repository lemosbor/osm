# osm
Создание карт для навигатора (автомобильного и туристического) на основе OSM


java -Xmx1600M -jar mkgmap.jar -c osm/osm.args osm/6324.typ *.osm.pbf

## Точки
-[Х] Максимальный масштаб
-[Х] Не показывать крупно башни (сотовой связи)
-[Х] Не отмечать свертки, плотины
-[Х] подпись для выхода на посадку
-[Х] Значок гостиницы крупный отображать до почти самого близкого масштаба
-[Х] Названия озер и заливов (появляются только на масштабе 3 км)
-[Х] название метро на масштабе 300, 200 м
-[Х] Названия торговых центров
-[Х] принцип отображения одной точки в разных масштабах (полиция и почта)
	1. Близкий масштаб и навигация (показывается во время движения)
	2. Каталогизация (без значка)
	3. Для крупного масштаба (мелкий значок). Без названия и с функцией удаления дубликатов
-[Х] Заправки (Красно-белая точка) 0x2804, 0x2f01, 0x6804
-[Х] Ресторан (Черно-коричневая точка) 0x281c, 0x2A01-, 0x6805
-[Х] Гостиницы (зеленая Г) 0x2803, 0x2B01, 0x6803
-[Х] Кемпинг (зеленая Л) 0x2800, 0x2B03, 0x6800
-[Х] Магазины (желтая точка) 0x2814, 0x2E02, 0x6814
-[Х] Моллы 0x2812, 0x2e04, 0x6812
-[Х] Достопримечательность (коричневая точка) 0x2801, 0x2c00, 0x6801
-[Х] Церкви
-[Х] Музеи
-[Х] Красивые места 0x2802, 0x2C04, 0x6802
-[Х] исключать из каталогизации дублирующиеся пои (для больших масштабов например) poi-excl-index=0x2a00-0x661f. Например 0x2816 не попадает (проверить строится ли вообще) в каталог, а 0x2801 попадает
-[Х] масштаб 50 (лес)
-[ ] Маршрутный точки должны быть под основными точками  

## Линии
-[ ] Номера дорог
-[ ] Номера веломаршрутов
-[Х] разбитые дороги превращать в треки
-[Х] Границы отображать только на крупном масштабе
-[ ] дороги желтые сделать белыми (0x09) с границами и пошире на масштабе от 300м. Дороги на масштабе 300м не объединяются (две полосы в одну)
-[ ] дифференциация дорог по цвету на масштабе 3-5-7 км (на других картах есть)
-[ ] масштаб 10-15-20-30 км как на других картах в части полигонов и дорожной сети, если приемлемая скорость загрузки
-[ ] составная линия для грунтовок
-[ ] простая линия для резиденций
-[ ] срелки для односторонок
-[ ] На светофоре повернуть (настройка уведомления о повороте)
-[ ] красная обводка для примечательных зданий

## Полигоны

## Стили
-[Х] добавить точки для троеточий
-[ ] торговые центры темно-красным цветом
-[ ] 0x2c0e — заменить на 0x2C13, а 0x2c0e новый значок для храмов
-[Х] 0x3a04 — церковь крупно
-[ ] значок для питьевой воды и колодца в виде круга? (сейчас используется 0x6509 для всех типов воды для целей каталогизации, хотя соседние номера свободны. Попробовать соседние и проверить каталогизатор)
-[ ] линии 0x10e05 и 0x10e01 для автострад дальнего масштаба как на других картах
-[ ] Приравнять оператора к имени  
-[ ] Пао оао ао  
-[ ] Не отображать названия заводов? 
-[ ] кресты для больниц крупнее
-[ ] Парковки не буквой Р, а буквой П.

## Проверить
-[ ] waterway=stream на Шавлинские озера на навигаторе
-[ ] в каталог Nuvi не попадают кемпинги (только гостиницы, гост. дома, мотели, комплексы, стоянки, )

## Маршрутизация
маршрут от отеля до Ласточкина гнезда
Инцидент в начале Варшавки

Разворот на трассе Кавказ
Объезд Славянска 13 минут, пробка 32 минуты
Дорога туда 4:30 (25 минут по Краснодару)
Дорога обратно 5:00
В Судак на прямую по плохой дороге 21 минута
Через Старый Крым 30 минут

## Сокращения
Сокращение окончаний слов  (ский -й, )
Сокращение торговых центров

## Эксперементы
Тип магазина в зависимости от размера
Молы квадратами
облака точек для определения кластеров (рестораны)
Крылатский велотрек
подписи вокзалов
Пешеходная, велосипедная и автомобильная навигация. Веломаршруты route=bicycle предпочтительнее
Если в городе, то строить точку mkgmap:city!=* & is_in:city=* { set mkgmap:city='${is_in:city}' }

## Справочно
Режимы объездов в Нуви:
- Развороты
- Шоссе
- Платные дороги
- Транспортный поток
- Паромы
- Пассажирские полосы
- Грунтовые дороги

Режимы объездов в БейсКэмп:
- внутриштатные / федеральные
- Хайвеи основные / автомагистрали
- Хайвеи штата / региональные
- Грунтовые дороги
- резидентские дороги

- Развороты (крутые)
- Carpool Lanes / полосы для АМ с пассажирами
- Платные дороги
- круговое движение
- узкие дороги
- закрытые в даты и время
- канатные дороги
- горные тропы

При этом объезды крутых разворотов включены в Нуви постоянно.

# Идеи
Пешеходные дороги — обычные дороги с блоками в начале и конце

# Команды
cd C:\mkgmap
java -Xmx9000M -jar mkgmap.jar -c osm.args 6324.typ *.osm.pbf
java -Xmx9000M -jar mkgmap.jar -c osm.args 6324.typ *.osm

java -Xmx8000M -jar mkgmap.jar -c osm.args *.osm.pbf
java -Xmx8000M -jar mkgmap.jar --gmapsupp *.img 6324.typ
java -Xmx4000M -jar mkgmap.jar -c osm.args -c splitter\template.args
java -Xmx8000M -jar josm-tested.jar
java -Xmx1000m -jar splitter.jar --output=pbf --output-dir=splitter --max-nodes=1600000 --mapid=63245001 --geonames-file=cities15000.txt 07.osm
java -Xmx1000M -jar mkgmap.jar -c osmNL.args -c splitter\template.args
java -Xmx1000M -jar mkgmap.jar --gmapsupp *.img 10010.typ

## Построение изогипс
Скачать Osmconvert и запустить директорию из командной строки
Скачать линии рельефа http://develop.freizeitkarte-osm.de/ele_20_100_500/
Запустить команду для извлечения линий рельефа: 
osmconvert Hoehendaten_Freizeitkarte_NOR.osm.pbf -o=Hoehendaten.o5m
Запустить команду для объединения файлов:
osmconvert --drop-version Hoehendaten.o5m norway-latest.osm.pbf -o=norway-latest2.osm.pbf


java -Xmx1000M -jar mkgmap.jar -c optionsfile.args *.osm.pbf

java -Xmx9000m -jar splitter.jar --output=pbf --output-dir=splitter --max-nodes=1400000 --mapid=63221001 --geonames-file=cities15000.txt --polygon-file=maldives.poly maldives-latest.osm.pbf

java -Xmx9000M -jar mkgmap.jar -c mkgmap.args jbm.typ *.osm.pbf


## структура файла gpx
<wpt lat="33.298835754394531" lon="31.556301116943359"><name>водопад</name></wpt>

## Карты
https://nakarte.me/#m=9/43.52067/7.14661&l=O&nktl=0g2lhzZLyKezoXfugFGruw
