--INSERT INTO test VALUES(59);
--SELECT * FROM test;
--DROP TABLE IF EXISTS Sensor1;
--CREATE TABLE Sensor1(flow INT, sensTime DATETIME);
--INSERT INTO Sensor1 VALUES(23, NOW());
SELECT * FROM Sensor1 ORDER BY sensTime;
--SET time_zone = '-04:00';
