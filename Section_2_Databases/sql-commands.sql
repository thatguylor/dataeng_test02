/* Setting up DDL */
DROP TABLE IF EXISTS Salesmen CASCADE;
DROP TABLE IF EXISTS Cars CASCADE;
DROP TABLE IF EXISTS Transactions;

CREATE TABLE IF NOT EXISTS Salesmen(
	Employee_id serial PRIMARY KEY,
	Salesperson VARCHAR ( 50 ) UNIQUE NOT NULL,
	First_name VARCHAR ( 50 ) NOT NULL,
	Last_name VARCHAR ( 50 ) NOT NULL,
	Manager VARCHAR ( 50 ) NOT NULL,
	Manager_id VARCHAR ( 50 ) NOT NULL,
	Store_location VARCHAR ( 50 ) NOT NULL,
	Team VARCHAR ( 50 ) NOT NULL,
	Phone VARCHAR ( 50 ) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Cars(
	Serial_number BIGSERIAL PRIMARY KEY,
	Weight INTEGER NOT NULL,
	Price INTEGER NOT NULL,
	Manufacturer VARCHAR ( 50 ) NOT NULL,
	Model_name VARCHAR ( 50 ) NOT NULL,
	Characteristics VARCHAR ( 255 ) NOT NULL
);

CREATE TABLE IF NOT EXISTS Transactions(
	Transaction_id serial PRIMARY KEY,
	Salesperson VARCHAR (50) REFERENCES salesmen(salesperson),
	Customer_name VARCHAR ( 50 ) NOT NULL,
	Customer_phone VARCHAR ( 50 ) NOT NULL,
	Transaction_date TIMESTAMP NOT NULL,
	Serial_number BIGINT REFERENCES cars(Serial_number)
);

/* Inserting Mockup values */ 
INSERT INTO Salesmen (Employee_id,Salesperson,First_name,Last_name,Manager,Manager_id,Store_location,Team,Phone) VALUES ('01','YaoKuan','Yao','Kuan','GovTech','04','SG','A','2311331');
INSERT INTO Salesmen (Employee_id,Salesperson,First_name,Last_name,Manager,Manager_id,Store_location,Team,Phone) VALUES ('02','ZhuangXian','Zhuang','Xian','GovTech','04','SG','A','4123123');
INSERT INTO Salesmen (Employee_id,Salesperson,First_name,Last_name,Manager,Manager_id,Store_location,Team,Phone) VALUES ('03','Shirin','Shi','Rin','GovTech','04','SG','A','512412');

INSERT INTO Cars (Serial_number,Weight,Price,Manufacturer,Model_name,Characteristics) VALUES ('0000001',300,100000,'Tesla','Model S','BigFastCarVeryElectric');
INSERT INTO Cars (Serial_number,Weight,Price,Manufacturer,Model_name,Characteristics) VALUES ('0000002',400,200000,'Doge','Model X','AlLNewCryptoCarVeryStonks');
INSERT INTO Cars (Serial_number,Weight,Price,Manufacturer,Model_name,Characteristics) VALUES ('0000003',500,300000,'Honda','Model Z','NewHondaCity:Blue');

INSERT INTO Transactions (Transaction_id,Salesperson,Customer_name,Customer_phone,Transaction_date,Serial_number) VALUES ('000000001','YaoKuan','FirstGuy','21312313131','2021-12-06 17:16:00','0000001');
INSERT INTO Transactions (Transaction_id,Salesperson,Customer_name,Customer_phone,Transaction_date,Serial_number) VALUES ('000000002','ZhuangXian','SecondGuy','21312313131','2021-12-06 16:16:00','0000002');
INSERT INTO Transactions (Transaction_id,Salesperson,Customer_name,Customer_phone,Transaction_date,Serial_number) VALUES ('000000003','Shirin','ThirdGuy','21312313131','2021-12-06 15:16:00','0000003');
INSERT INTO Transactions (Transaction_id,Salesperson,Customer_name,Customer_phone,Transaction_date,Serial_number) VALUES ('000000004','YaoKuan','FourthGuy','21312313131','2021-12-06 18:16:00','0000003');


/* SQL Query 1*/ 
SELECT Transactions.Customer_name,  SUM(Cars.Price) AS Total_Spending 
FROM Transactions
INNER JOIN Cars
ON Cars.Serial_number = Transactions.Serial_number
GROUP BY Transactions.Customer_name 
ORDER BY SUM(Cars.Price) DESC
;  

/*SQL Query 2*/ 
SELECT Cars.Manufacturer,  COUNT(Transactions.Serial_number) AS Units_sold
FROM Transactions
INNER JOIN Cars 
ON Cars.Serial_number = Transactions.Serial_number
WHERE Transaction_date >= date_trunc('month', CURRENT_DATE) 
GROUP BY Cars.Manufacturer 
ORDER BY Units_sold DESC
;
