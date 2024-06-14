#Reviewing the tables to make a better analysis#
select * from products;
select * from warehouses;
select * from orderdetails;
#Checking the overall scenario on the car sales and inventory#
select p.*,w.warehousename from products p left join warehouses w on p.warehouseCode=w.warehouseCode;
#Total  inventory of cars across warehouses#
select w.warehousename, sum(p.quantityinstock)
 from products p left join warehouses w on p.warehouseCode=w.warehouseCode 
group by w.warehousename order by 2;
#Total inventory of products#
select productname, sum(quantityinstock) from products group by productName order by 2 desc;
#Total quantity of cars orders and the inventory across warehouses#
select p.productcode, p.productname,p.quantityinstock,sum(od.quantityordered), p.quantityInStock-sum(od.quantityordered) as inventorysurplus,w.warehousename
 from products p left join orderdetails od on p.productCode = od.productCode left join warehouses w on w.warehouseCode = p.warehouseCode group by
p.productcode, p.productname,p.quantityinstock, w.warehouseName order by inventorysurplus desc ;
#Checking which warehouse has the maximum inventory surplus#
select w.warehousename,sum(p.quantityInStock-od.quantityordered) as inventorysurplus
 from products p left join orderdetails od on p.productCode = od.productCode left join warehouses w on w.warehouseCode = p.warehouseCode group by w.warehouseName 
 order by inventorysurplus desc ;
 #Checking which product has the maximum inventory surplus
 select p.productname,p.quantityInStock,w.warehousename from products p left join warehouses w on p.warehouseCode=w.warehouseCode group by
 p.productName,w.warehouseName;
 select p.productcode, p.productname,p.buyPrice,sum(od.quantityordered)
 from products p left join orderdetails od on p.productCode = od.productCode group by
p.productcode, p.productname order by p.buyPrice ;