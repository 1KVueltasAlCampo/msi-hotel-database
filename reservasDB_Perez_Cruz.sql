CREATE TABLE Hotel
 (hotelNo INT NOT NULL UNIQUE PRIMARY KEY,
  hotelName VARCHAR(85),
  city VARCHAR(85)
  );
  CREATE TABLE Guest
  ( guestNo INT NOT NULL UNIQUE PRIMARY KEY,
    guestName VARCHAR(85),
    guestAddress VARCHAR(85)
  );
  CREATE TABLE Room
  ( hotelNo INT NOT NULL UNIQUE,
    roomNo INT NOT NULL UNIQUE,
    type VARCHAR(85),
    price INT,
    PRIMARY KEY (hotelNo,roomNo),
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo),
    CHECK (type IN('Single','Family','Double')),
    CHECK (price>9 AND price<101),
    CHECK (roomNo>0 AND roomNo<121)
  );
  CREATE TABLE Booking
  (hotelNo INT NOT NULL UNIQUE,
   guestNo INT NOT NULL UNIQUE,
   dateFrom DATE NOT NULL UNIQUE,
   dateTo DATE,
   roomNo INT,
   PRIMARY KEY (hotelNo,guestNo,dateFrom),
   FOREIGN KEY(hotelNo) REFERENCES Hotel(hotelNo),
   FOREIGN KEY(guestNo) REFERENCES Guest(guestNo),
   FOREIGN KEY(roomNo) REFERENCES Room(roomNo),
   CHECK (dateTo > CURRENT_DATE AND dateFrom > CURRENT_DATE)
  );
  
  INSERT INTO Hotel VALUES(001,'el viajero feliz','Cali');
  INSERT INTO Hotel VALUES(002,'el viajero curioso','Buenaventura');
  INSERT INTO Hotel VALUES(003,'el viajero joven','Guadalajara de Buga');
  INSERT INTO Hotel VALUES(004,'el viajero enamorado','Roldanillo');
  INSERT INTO Hotel VALUES(005,'el viajero retirado','Palmira');
  INSERT INTO Hotel VALUES(006,'el viajero simple','Cali');
  INSERT INTO Hotel VALUES(007,'el viajero de calle','Alcala');
  INSERT INTO Hotel VALUES(008,'el viajero aburrido','Zarzal');
  INSERT INTO Hotel VALUES(009,'el viajero programador','Armenia');
  INSERT INTO Hotel VALUES(010,'el viajero de Polombia','Bogota');
  
  INSERT INTO Guest VALUES(001,'Juan','Cra 21 # 34-66');
  INSERT INTO Guest VALUES(002,'Sebastian','Cll 13 # 28-18');
  INSERT INTO Guest VALUES(003,'David','Cra 38 # 30-12');
  INSERT INTO Guest VALUES(004,'Nicolas','Cra 06 # 12-56');
  INSERT INTO Guest VALUES(005,'Santiago','Cll 20 # 15-80');
  INSERT INTO Guest VALUES(006,'Valentina','Cra 32 # 50-12');
  INSERT INTO Guest VALUES(007,'Catherine','Cra 38 # 60-62');
  INSERT INTO Guest VALUES(008,'Isabela','Cra 48 # 21-12');
  INSERT INTO Guest VALUES(009,'Jose','Cra 52 # 31-72');
  INSERT INTO Guest VALUES(010,'Paula','Cra 18 # 42-12');
  
  --INSERT INTO Room VALUES(001,001,'personal',200); Falla porque price es mayor a 100. Para corregir esto ahora los valores estaran dentro del intervalo
  --INSERT INTO Room VALUES(001,001,'personal',100); Falla porque las categoria no esta en el conjunto {Single,Double,Family}. Para corregir esto ahora se pondran en el conjunto adecuado.
  INSERT INTO Room VALUES(001,001,'Single',50);
  INSERT INTO Room VALUES(002,002,'Family',10);
  INSERT INTO Room VALUES(003,003,'Double',24);
  INSERT INTO Room VALUES(004,004,'Single',10);
  INSERT INTO Room VALUES(005,005,'Double',40);
  INSERT INTO Room VALUES(006,006,'Double',10);
  INSERT INTO Room VALUES(007,007,'Single',21);
  INSERT INTO Room VALUES(008,008,'Family',89);
  INSERT INTO Room VALUES(009,009,'Single',50);
  --INSERT INTO Room VALUES(010,010,'Single',3); Falla porque el precio no esta entre 10 y 100
  INSERT INTO Room VALUES(010,010,'Single',33);
  
  --INSERT INTO Booking VALUES(001,001,'01/05/2022','03/05/2022',001); Falla por el formato de fecha
  INSERT INTO Booking VALUES(001,001,'2022-05-10','2022-05-11',005);
  INSERT INTO Booking VALUES(002,002,'2022-05-11','2022-05-12',004);
  INSERT INTO Booking VALUES(003,003,'2022-05-13','2022-05-14',005);
  INSERT INTO Booking VALUES(004,004,'2022-05-15','2022-05-16',002);
  INSERT INTO Booking VALUES(005,005,'2022-05-17','2022-05-17',001);
  INSERT INTO Booking VALUES(006,006,'2022-05-18','2022-05-18',008);
  INSERT INTO Booking VALUES(007,007,'2022-05-19','2022-05-19',002);
  INSERT INTO Booking VALUES(008,008,'2022-05-21','2022-05-22',004);
  INSERT INTO Booking VALUES(009,009,'2022-05-22','2022-05-23',006);
  INSERT INTO Booking VALUES(010,010,'2022-05-24','2022-05-25',009);