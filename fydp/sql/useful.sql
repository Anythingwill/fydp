--INSERT INTO test VALUES(59);
--SELECT * FROM test;
DROP TABLE IF EXISTS Sensor1;
CREATE TABLE Sensor1(flow DOUBLE NOT NULL, sensTime DATETIME NOT NULL);
--INSERT INTO Sensor1 VALUES(11.33, NOW());
SELECT * FROM Sensor1 ORDER BY sensTime;
--SELECT * FROM Sensor1 ORDER BY sensTime HAVING sensTime > STR_TO_DATE('2013,7,15', '%Y,%m,%d');
--SELECT * FROM Sensor1 WHERE sensTime > STR_TO_DATE('7/15/2013', '%m/%d/%Y') ORDER BY sensTime;
--INSERT INTO Sensor1 VALUES(100,  STR_TO_DATE('11,7,2013', '%d,%m,%Y'));
--SELECT * FROM Sensor1 ORDER BY sensTime;
--SELECT STR_TO_DATE('11,7,2013', '%d,%m,%Y');
--SET time_zone = '-04:00';

--SELECT * FROM Sensor1 ORDER BY sensTime --WHERE sensTime >= STR_TO_DATE('07/02/2013', '%m/%d/%Y') AND sensTime <= STR_TO_DATE('07/15/2013', '%m/%d/%Y') ORDER BY sensTime;
--SELECT * FROM hacked
--SELECT * FROM