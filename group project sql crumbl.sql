use ts_61608_2;

#list the number of stores that are specifically in the states of GA, al

select * from location
where state in ('GA', 'AL'); 

select * from orderDetails
join cookiesOffered on cookiesOffered.cookieFlavorID = orderDetails.cookieFlavorID
join location on cookiesOffered.locationID = location.locationID;

#Write a query to list the different locations, the number of employees at each location, and what percentage of cookie sales come from each location.
select streetAddress, concat(round((count(orderID)/(select count(orderId) from orderDetails))*100,2),'%') as percSales from orderDetails
join cookiesOffered on cookiesOffered.cookieFlavorID = orderDetails.cookieFlavorID
join location on cookiesOffered.locationID = location.locationID
group by streetAddress;

select firstName, lastName, employees.salary from employees
join position on position.positionID = employees.positionID
where employees.salary > (select avg(salary) from employees 
						where position.positionID = employees.positionID)
order by employeeID asc;

select * from employees;
