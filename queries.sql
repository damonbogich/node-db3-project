-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
Select p.ProductName, c.CategoryName
From [Category] as c 
Inner Join Product as p on c.Id = p.CategoryId
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
Select o.Id, s.CompanyName, o.OrderDate
From [Order] as o
Inner Join Shipper as s on o.ShipVia = s.Id
WHERE o.OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
Select p.ProductName, od.Quantity, od.OrderId
From [Product] as p
Inner Join OrderDetail as od on od.ProductId = p.Id
WHERE od.OrderId = 10251
Order By p.ProductName, Asc  -- ask Izzy why the order is the same whether you do asc or desc.. alphabetical
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
Select o.Id as OrderId, c.CompanyName as Customer_Company_Name, e.LastName as Employee_Last_Name
From [Order] as o 
Inner Join Customer as c on o.CustomerId = c.Id
Inner Join Employee as e on o.EmployeeId = e.Id
