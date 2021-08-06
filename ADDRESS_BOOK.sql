use address_book;
CREATE TABLE addressbook (firstName VARCHAR(15) NOT NULL, lastName VARCHAR(15) NOT NULL,     
		address VARCHAR(40) NOT NULL, city VARCHAR(10) NOT NULL, state VARCHAR(20) NOT NULL, 
        zip VARCHAR(6) , phoneNumber VARCHAR(10) ) ;
        
INSERT INTO addressbook VALUES ("ANIL", "BALI", "JAYANAGAR", "GULBARGA", "KARNATAKA", 585105, "8217451010");
describe addressbook;
ALTER TABLE addressbook DROP COLUMN zip;
ALTER TABLE addressbook ADD COLUMN zip VARCHAR(6) AFTER state;
INSERT INTO addressbook VALUES ("ANIL", "BALI", "JAYANAGAR", "GULBARGA", "KARNATAKA", 585105, "8217451010");
INSERT INTO addressbook VALUES ("SUNIL","SHETTY","SEDAMROAD","GULBARGA","KARNATAKA",585105,"9945273225");
DELETE FROM addressbook WHERE firstName = "ANIL";
INSERT INTO addressbook  VALUES ("ANIL", "BALI", "JAYANAGAR", "GULBARGA", "KARNATAKA", 585105, "8217451010") ON DUPLICATE KEY UPDATE firstName="ANIL";
INSERT INTO addressbook VALUES ("SAGAR", "PATIL", "JAYANAGAR", "GULBARGA", "KARANATAKA", "585105", "8123188807"); 
UPDATE addressbook SET firstName = "SHARANU", lastName = "BIRADHAR", address = "SEDAMROAD", city = "GULBARGA", zip = 585105 WHERE firstName = "SUNIL" ;
INSERT INTO addressbook VALUES ("SUNIL","SHETTY","SEDAMROAD","GULBARGA","KARNATAKA",585105,"9945273225");
DELETE FROM addressbook WHERE firstName = "SAGAR";
INSERT INTO addressbook VALUES ("CHANDRU","REDDY","KAMLAPUR","GULBARGA","KARNATAKA",585105,"9902658482");
SELECT * FROM addressbook WHERE city = "KAMLAPUR";
SELECT firstName, lastName FROM addressbook WHERE city = "KAMLAPUR";
SELECT count(city or state) FROM addressbook;
SELECT city, firstName FROM addressbook ORDER BY (firstName);
ALTER TABLE addressbook ADD COLUMN relation VARCHAR(6) AFTER zip;  
ALTER TABLE addressbook ADD COLUMN name VARCHAR(6) AFTER zip;  
UPDATE addressbook SET name = 'SAGAR', relation = 'friend' WHERE firstName = 'Anil';
UPDATE addressbook SET name = 'SUNIL', relation = 'family' WHERE firstName = 'CHANDRU';
ALTER TABLE addressbook CHANGE name name VARCHAR(20); 
ALTER TABLE addressbook CHANGE relation relation VARCHAR(20);
UPDATE addressbook SET name = 'ANIL', relation = 'Profession,' WHERE firstName = 'SAGAR';
UPDATE addressbook SET name = 'SUNIL', relation = 'Profession' WHERE firstName = 'CHANDRU';
SELECT count(relation) FROM addressbook;
SELECT * FROM addressbook;

CREATE TABLE PersonName( Id INT AUTO_INCREMENT PRIMARY KEY, firstName VARCHAR(10), lastName VARCHAR(10),
			addressId INT);
            
INSERT INTO PersonName VALUES ('1', 'ANIL', 'BALI', '2005');
INSERT INTO PersonName VALUES ('2','SUNIL', 'SHETTY', '2006');
INSERT INTO PersonName VALUES ('3','SAGAR', 'PATIL', '2007');
INSERT INTO PersonName VALUES ('4','CHANDRU', 'REDDY', '2008');
SELECT * FROM PersonName;

CREATE TABLE Address ( Id INT PRIMARY KEY AUTO_INCREMENT , city VARCHAR(10), state VARCHAR(10), zip varchar(6), phoneNo VARCHAR(10), personId INT);
INSERT INTO Address VALUES ('100', "JAYANAGAR", "GULBARGA", "KARNATAKA", 585105,8217451010,501);
INSERT INTO Address VALUES ('101', "SEDAMROAD","GULBARGA","KARNATAKA",585105,"9945273225" '1001');
INSERT INTO Address VALUES ('102', 'PUNE', 'MAHARASHTRA', '413333', '867854', '1003');
INSERT INTO Address VALUES ('103', 'HYDERABAAD', 'TELANGANA', '432131', '9874651', '1004');

SELECT * FROM Address;
ALTER TABLE Address ADD FOREIGN KEY (personId) REFERENCES PersonName(Id);
ALTER TABLE PersonName ADD FOREIGN KEY (addressId) REFERENCES Address(Id);

CREATE TABLE Connections(personId INT , relativeName VARCHAR(20), relation VARCHAR(20), FOREIGN KEY (personId) REFERENCES PersonName(Id));
INSERT INTO Connections VALUES ( '1', 'ANIL', 'FRIEND');
INSERT INTO Connections VALUES ( '2', 'SUNIL', 'Family');
INSERT INTO Connections VALUES ( '3', 'SAGAR', 'FRIEND');
SELECT * FROM Connections;

SELECT * FROM (PersonName INNER JOIN  Address ON PersonName.Id = Address.personId) 
		INNER JOIN Connections ON Connections.personId = PersonName.Id;
SELECT * FROM PersonName RIGHT JOIN  Address ON PersonName.Id = Address.personId;
SELECT * FROM PersonName LEFT JOIN  Address ON PersonName.Id = Address.personId;