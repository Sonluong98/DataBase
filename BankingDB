--CREATE  DATABASE banking;
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'banking')
    CREATE DATABASE banking;
GO

USE banking;

CREATE TABLE Banks(
    Bank_ID VARCHAR(10) PRIMARY KEY,
    Bank_name NVARCHAR(20) UNIQUE NOT NULL,
    Bank_location VARCHAR(25) NOT NULL
);

CREATE TABLE Users(
    User_ID VARCHAR(10) PRIMARY KEY,
    Iden_ID VARCHAR(12) UNIQUE NOT NULL,
    First_name VARCHAR(10) NOT NULL,
    Last_name VARCHAR(10) NOT NULL,
    Mail VARCHAR(15) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL,
    User_location VARCHAR(20) NOT NULL,
    Bank_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Bank_ID) REFERENCES  Banks(Bank_ID)
);

CREATE TABLE Accounts(
    Account_ID VARCHAR(25) PRIMARY KEY,
    User_ID VARCHAR(10) NOT NULL,
    Account_type VARCHAR(20) DEFAULT 'Checking' CHECK (Account_type IN('Checking', 'Saving', 'Foreign', 'Loan')),
    Account_creation_time DATETIME NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Transactions(
    Transaction_ID VARCHAR(10) PRIMARY KEY,
    Account_ID VARCHAR(25) NOT NULL,
    Transaction_type VARCHAR(10) DEFAULT 'Deposit' CHECK (Transaction_type IN ('Deposit', 'Saving','Transfer')),
    Time_of_transaction DATETIME NOT NULL,
    Amount INT NOT NULL CHECK (Amount > 0),
    Recipient_account VARCHAR(25) NOT NULL,
    CHECK (Transaction_type != 'Transfer' OR Account_ID != Recipient_account),
    FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID),
    FOREIGN KEY (Recipient_account) REFERENCES Accounts(Account_ID)
);