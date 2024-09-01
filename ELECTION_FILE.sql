USE master;
ALTER DATABASE ELECTION SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

DROP DATABASE IF EXISTS ELECTION;
CREATE DATABASE ELECTION;
USE ELECTION;

CREATE TABLE VOTER(
VID INT PRIMARY KEY,
VNAME VARCHAR(50) NOT NULL,
DOB DATE,
ADDRESS VARCHAR(50) NOT NULL,
AGE INT
);

CREATE TABLE CANDIDATE(
CANDIDATEID VARCHAR(50) PRIMARY KEY,
PARTYAFFILIATION VARCHAR(50) NOT NULL
);

CREATE TABLE CONSTITUENCY(
CID INT PRIMARY KEY,
CNAME VARCHAR(50)
);

CREATE TABLE POLLING_STATION(
STATIONID INT PRIMARY KEY,
LOCATION VARCHAR(50),
OFFICERNAME VARCHAR(50)
);

-- Inserting values into VOTER table
INSERT INTO VOTER (VID, VNAME, DOB, ADDRESS, AGE) VALUES 
(1, 'John Doe', '1980-01-15', '123 Elm St', 44),
(2, 'Jane Smith', '1992-03-22', '456 Oak St', 32),
(3, 'Alice Johnson', '1985-06-30', '789 Pine St', 39),
(4, 'Bob Brown', '1978-11-10', '101 Maple St', 45),
(5, 'Emily Davis', '1995-02-28', '202 Birch St', 29);

-- Inserting values into CANDIDATE table
INSERT INTO CANDIDATE (CANDIDATEID, PARTYAFFILIATION) VALUES 
('C001', 'Party A'),
('C002', 'Party B'),
('C003', 'Party C'),
('C004', 'Party D'),
('C005', 'Party E');

-- Inserting values into CONSTITUENCY table
INSERT INTO CONSTITUENCY (CID, CNAME) VALUES 
(1, 'Constituency 1'),
(2, 'Constituency 2'),
(3, 'Constituency 3'),
(4, 'Constituency 4'),
(5, 'Constituency 5');

-- Inserting values into POLLING_STATION table
INSERT INTO POLLING_STATION (STATIONID, LOCATION, OFFICERNAME) VALUES 
(1, 'Location A', 'Officer A'),
(2, 'Location B', 'Officer B'),
(3, 'Location C', 'Officer C'),
(4, 'Location D', 'Officer D'),
(5, 'Location E', 'Officer E');


CREATE TABLE VOTER_CANDIDATE(
VID INT,
CANDIDATEID VARCHAR(50)
PRIMARY KEY(VID,CANDIDATEID),
FOREIGN KEY(VID) REFERENCES VOTER(VID),
FOREIGN KEY(CANDIDATEID) REFERENCES CANDIDATE(CANDIDATEID)
);

CREATE TABLE CANDIDATE_CONSTITUENCY (
    CANDIDATEID VARCHAR(50),
    CID INT,
    PRIMARY KEY (CANDIDATEID),
    FOREIGN KEY (CANDIDATEID) REFERENCES CANDIDATE(CANDIDATEID),
    FOREIGN KEY (CID) REFERENCES CONSTITUENCY(CID)
);

CREATE TABLE CONSTITUENCY_POLLING_STATION (
    CID INT,  -- Foreign key referencing CONSTITUENCY
    STATIONID INT,  -- Foreign key referencing POLLING_STATION
    PRIMARY KEY (CID, STATIONID),
    FOREIGN KEY (CID) REFERENCES CONSTITUENCY(CID),
    FOREIGN KEY (STATIONID) REFERENCES POLLING_STATION(STATIONID)
);

SELECT * FROM VOTER;
SELECT * FROM CANDIDATE;
SELECT * FROM CONSTITUENCY;
SELECT * FROM POLLING_STATION;

ALTER TABLE VOTER
ADD phone_number VARCHAR(15);

SELECT * FROM VOTER;


UPDATE VOTER
SET AGE=50
WHERE VID=1;

SELECT * FROM VOTER;

ALTER TABLE VOTER
DROP COLUMN AGE;

SELECT * FROM VOTER;

DELETE FROM VOTER
WHERE VID=2;

SELECT * FROM VOTER;


TRUNCATE TABLE VOTER;

SELECT * FROM VOTER;