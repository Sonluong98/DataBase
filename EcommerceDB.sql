--CREATE DATABASE EcommDB;
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name= N'EcommDB')
    CREATE DATABASE EcommDB;
GO;
USE EcommDB;

CREATE TABLE Products(
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_name VARCHAR(20) NOT NULL,
    Price INT NOT NULL,
    Product_type_ID VARCHAR(10) NOT NULL,
    Supplier_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Product_type_ID) REFERENCES Product_types(Product_type_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID)
);

CREATE TABLE Users(
    User_ID         VARCHAR(10) PRIMARY KEY,
    Name_acc        VARCHAR(10) UNIQUE NOT NULL,
    Hashed_password VARCHAR(15) NOT NULL,
    First_name      NVARCHAR(10) NOT NULL,
    Last_name       NVARCHAR(10) NOT NULL,
    Date_of_bird    DATE NOT NULL,
    Phone_number    VARCHAR(15) UNIQUE NOT NULL,
    Loca            NVARCHAR(50) NOT NULL,
    Email           VARCHAR(20) UNIQUE NOT NULL,
    Date_creat_acc  DATE NOT NULL
);

CREATE TABLE Orders(
    Order_ID VARCHAR(10) PRIMARY KEY,
    User_ID VARCHAR(10) NOT NULL,
    Order_date DATETIME NOT NULL,
    Comlete_date DATETIME NOT NULL,
    Total_price INT NOT NULL,
    Discount INT NOT NULL,
    Total_sales INT NOT NULL,
    Shipping_carrier_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Shipping_carrier_ID) REFERENCES Shipping_carrier(Shipping_carier_ID)
);

CREATE TABLE Suppliers(
    Supplier_ID VARCHAR(10) PRIMARY KEY,
    Supplier_name NVARCHAR(15) NOT NULL,
    Type_business VARCHAR(10) DEFAULT 'Personal' CHECK (Type_business IN ('Personal','Company')),
    Phone_number VARCHAR(10) UNIQUE NOT NULL,
    Loca VARCHAR(30)
);

CREATE TABLE Product_types(
    Product_type_ID VARCHAR(10) PRIMARY KEY,
    Product_type_name VARCHAR(20),
);

CREATE TABLE Order_item(
    Order_ID VARCHAR(10) NOT NULL,
    Product_ID VARCHAR(10) NOT NULL,
    User_ID VARCHAR(10) NOT NULL,
    Number_item INT NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Return_request(
    Return_ID VARCHAR(10) PRIMARY KEY,
    User_ID VARCHAR(10) NOT NULL,
    Order_ID VARCHAR(10) NOT NULL,
    Item_ID VARCHAR(10) NOT NULL,
    Number_item INT NOT NULL,
    Value_return INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Shipping_carrier(
    Shipping_carier_ID VARCHAR(10) PRIMARY KEY,
    shipping_carrier_name VARCHAR(20) NOT NULL
);

CREATE TABLE Inventory(
    Product_ID VARCHAR(10) PRIMARY KEY,
    Inven_number INT NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

CREATE TABLE Quantity_sold(
    Product_ID VARCHAR(10) PRIMARY KEY,
    Sold_number INT NOT NULL
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);