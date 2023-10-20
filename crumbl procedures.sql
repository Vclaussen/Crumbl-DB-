use ts_61608_2;

create procedure TP_Q1()
SELECT COUNT(locationID) FROM location
WHERE state REGEXP 'GA';

call TP_Q1();

create procedure TP_Q2()
SELECT CONCAT(COUNT(*)/(SELECT COUNT(*) FROM orderDetails)*100, '%') AS percOfSugar FROM cookieFlavor
JOIN cookiesOffered ON cookiesOffered.cookieFlavorID = cookieFlavor.cookieFlavorID
JOIN orderDetails ON orderDetails.cookieFlavorID = cookiesOffered.cookieFlavorID
WHERE orderDetails.cookieFlavorID = 2
GROUP BY orderDetails.cookieFlavorID;

call TP_Q2;

create procedure TP_Q3()
SELECT ownerName FROM Owner
JOIN location ON location.locationID = Owner.locationID
WHERE state IN ('GA', 'TX');

call TP_Q3;

create procedure TP_Q4()
SELECT DISTINCT locationID FROM Owner
WHERE NOT EXISTS (SELECT * FROM location WHERE ownerName = 'Matt');

call TP_Q4;

create procedure TP_Q5()
SELECT COUNT(flavorName) FROM cookieFlavor
WHERE flavorName REGEXP 'chocolate';

call TP_Q5;

create procedure TP_Q6()
SELECT flavorName, price FROM cookieFlavor
JOIN cookiesOffered ON cookieFlavor.cookieFlavorID = cookiesOffered.cookieFlavorID
JOIN orderDetails ON cookiesOffered.locationID = orderDetails.locationID
WHERE price > (SELECT AVG(price) FROM orderDetails);

call TP_Q6;



create procedure TP_Q7()
SELECT COUNT(locationID), state FROM location
GROUP BY state
HAVING COUNT(locationID) > 1;

call TP_Q7;



create procedure TP_Q8()
select * from location
where state in ('GA', 'AL'); 

call TP_Q8;



create procedure TP_Q9()
select streetAddress, concat(round((count(orderID)/(select count(orderId) from orderDetails))*100,2),'%') as percSales from orderDetails
join cookiesOffered on cookiesOffered.cookieFlavorID = orderDetails.cookieFlavorID
join location on cookiesOffered.locationID = location.locationID
group by streetAddress;

call TP_Q9;



create procedure TP_Q10()
select firstName, lastName, employees.salary from employees
join position on position.positionID = employees.positionID
where employees.salary > (select avg(salary) from employees 
						where position.positionID = employees.positionID)
order by employeeID asc;


call TP_Q10;










