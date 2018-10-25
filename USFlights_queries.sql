USE usairlineflights2;

# Request 1: Quantitat de registres de la taula de vols
SELECT COUNT(*) AS 'TOTAL flight registries:' FROM flights;

# Request 2: Retard promig de sortida i arribada segons aeroport d'origen
SELECT Origin, AVG(DepDelay) AS 'Departure AVG delay:', AVG(ArrDelay) AS 'Arrival AVG delay:' FROM flights GROUP BY 1 ORDER BY 1;


# Request 3: Retard promig d'arribada dels vols per mesos i segons aeroport d'origen, ordenat
SELECT Origin, colYear AS 'Year', colMonth AS 'Month', AVG(ArrDelay) AS 'Arrival AVG delay:' FROM flights GROUP BY 1, 2, 3 ORDER BY 1, 2, 3;


# Request 4: Idem que 3 però mostrant nom de l'aeroport
SELECT city as 'City', colYear AS 'Year', colMonth AS 'Month', AVG(ArrDelay) AS 'Arrival AVG delay:' FROM airports JOIN flights ON flights.Origin=airports.iata GROUP BY 1, 2, 3 ORDER BY 1, 2, 3;
### Comprovació: mostrem també l'aeroport d'origen i el comparem amb el d'abans:
### 	SELECT Origin, city, colYear, colMonth, AVG(ArrDelay) AS 'Arrival AVG delay:' FROM airports JOIN flights ON flights.Origin=airports.iata GROUP BY 1, 3, 4 ORDER BY 1, 3, 4;


# Request 5: Companyies amb més vols cancel·lats ordenades descendentment
SELECT Description, SUM(Cancelled) AS 'Total cancelled flights' FROM carriers JOIN flights ON carriers.CarrierCode=flights.UniqueCarrier GROUP BY 1 ORDER BY 2 DESC;

# Request 6: Identificador dels 10 avions que més distància han recorregut fent vols
SELECT UniqueCarrier AS 'Plane ID:', SUM(Distance) AS 'Total KM:' FROM flights GROUP BY 1 ORDER BY 2 DESC LIMIT 10;

# Request 7: Companyies amb un retard promig d'arribada a destí que sigui superior a 10 minuts
SELECT Description AS 'Company:', AVG(ArrDelay) AS 'Arrival AVG delay:' FROM carriers JOIN flights ON carriers.CarrierCode=flights.UniqueCarrier GROUP BY 1 HAVING AVG(ArrDelay)>10 ORDER BY 2 DESC;