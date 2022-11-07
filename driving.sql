/* a. */
CREATE TABLE InsuranceCo (
	name VARCHAR(300),
	phone VARCHAR(15)
);

CREATE TABLE Person (
	SSN BIGINT PRIMARY KEY,
	name VARCHAR(300)
);

CREATE TABLE Driver (
	driverID BIGINT PRIMARY KEY
	SSN BIGINT,
	FOREIGN KEY(SSN) REFERENCES Person(SSN)
);

CREATE TABLE NonProfessionalDriver (
	driverID BIGINT PRIMARY KEY,
	FOREIGN KEY(driverID) REFERENCES Driver(driverID)
);

CREATE TABLE ProfessionalDriver (
	driverID BIGINT PRIMARY KEY,
	medicalHistory VARCHAR(300),
	FOREIGN KEY(driverID) REFERENCES Driver(driverID)
);

CREATE TABLE Vehicle (
	licensePlate VARCHAR(30) PRIMARY KEY,
	year BIGINT,
	maxLiability INT,
	OWNERSSN BIGINT,
	insurance VARCHAR(300),
	FOREIGN KEY(OWNERSSN) REFERENCES Person(SSN),
	FOREIGN KEY(insurance) REFERENCES InsuranceCo(name)
);

CREATE TABLE Car (
	licensePlate VARCHAR(30) PRIMARY KEY,
	make VARCHAR(50),
	FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Truck (
	licensePlate VARCHAR(30) PRIMARY KEY,
	capacity BIGINT,
	driverId BIGINT,
	FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate),
	FOREIGN KEY(driverId) REFERENCES ProfessionalDriver(driverId)
);



/*
b. 

Insures relationship is represented by these columns:
insuranceCo,
maxLiability in the Vehicle relation. This is because Vehicle cannot
have more than one insurance information entry.

c.

A truck can have only one operator. Expressed by adding operators driver ID.
However, a car can be driven by multiple persons, so its represented
in a different table.


*/