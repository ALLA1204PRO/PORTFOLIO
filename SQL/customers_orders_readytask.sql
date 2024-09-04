Необходимо написать запросы, которые будут выводить следующую информацию:
1.	Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 
2.	Вывести названия компаний поставщиков, которые находятся в México D.F.;
3.	Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
4.	Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;
5.	Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.
6.	Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
7.	Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.
CREATE TABLE Customers (
  CustomerID VARCHAR(5) PRIMARY KEY,
  CompanyName VARCHAR(40) NOT NULL,
  Address VARCHAR(60) NOT NULL,
  City VARCHAR(15) NOT NULL,
  Country VARCHAR(15) NOT NULL
);

INSERT INTO Customers (CustomerID, CompanyName, Address, City, Country)
VALUES
  ('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Germany'),
  ('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'Mexico'),
  ('ANTON', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', 'Mexico'),
  ('AROUT', 'Around the Horn', '120 Hanover Sq.', 'London', 'UK'),
  ('BERGS', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', 'Sweden'),
  ('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 'MannheimCity', 'Germany'),
  ('BLONP', 'Blondesddsl père et fils', '24, place Kléber', 'StrasbourgCity', 'France'),
  ('BOLID', 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'MadridCity', 'Spain');
  
CREATE TABLE Orders (
    OrderID INT NOT NULL,
    CustomerID VARCHAR(5) NOT NULL,
    OrderDate DATE NOT NULL,
    OrderSum INT NOT NULL,
    PRIMARY KEY (OrderID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderSum)
VALUES
  (10355, 'AROUT', '1996-11-15', 10000.00),
  (10365, 'ANTON', '1996-11-27', 15000.00),
  (10381, 'LILAS', '1996-12-12', 20000.00),
  (10436, 'BLONP', '1997-02-05', 17500.00),
  (10442, 'ERNSH', '1997-02-11', 20000.00),
  (10449, 'BLONP', '1997-02-18', 10000.00),
  (10453, 'AROUT', '1997-02-21', 15000.00);
  
SELECT CompanyName
FROM Customers
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM Orders
    WHERE OrderDate BETWEEN '1996-11-15' AND '1997-02-18'
);

SELECT CompanyName
FROM Customers
WHERE City = 'México D.F.';

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1996-12-12' AND '1997-02-18';

SELECT CompanyName
FROM Customers
WHERE CompanyName LIKE 'An%';

SELECT c.CompanyName, o.OrderID, o.OrderSum
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderSum > 17000;

SELECT c.CompanyName AS SupplierName, o.OrderSum
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY SupplierName DESC;

SELECT c.CompanyName AS SupplierName, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
