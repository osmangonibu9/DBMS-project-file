--3
--1
Select bus.bus_name,company.name
from bus,company
where bus.company_id=company.id
--2
SELECT driver.name AS driver_name, company.name AS company_name 
FROM driver,company,bus 
where driver.bus_id = bus.bus_id and bus.company_id = company.id and company.name = 'SR Group';
--3
SELECT COUNT(*) AS passenger_count
FROM book_ticket,bus
WHERE book_ticket.bus_id = bus.bus_id
and bus.bus_name = 'Alam';
--4
SELECT pssenger.p_id, pssenger.frst_name, pssenger.last_name, AVG(payment.amount) AS average_payment
FROM payment,pssenger 
where payment.passenger_id = pssenger.p_id
GROUP BY pssenger.p_id, pssenger.frst_name, pssenger.last_name;
--5
SELECT 
    company.name AS company_name,
    COUNT(bus.bus_id) AS total_buses
FROM 
    bus,company
where bus.company_id = company.id
GROUP BY 
    bus.company_id;
--6
	SELECT CONCAT(first_name,' ',last_name)AS FULL_NAME,PHONE FROM passenger
WHERE phone like '19%'
--7
SELECT p.p_id, p.frst_name, p.last_name, p.gender, p.email, p.phone, COUNT(pay.payment_id) AS num_payments
FROM pssenger p
JOIN payment pay ON p.p_id = pay.passenger_id
GROUP BY p.p_id, p.frst_name, p.last_name, p.gender, p.email, p.phone
HAVING num_payments > 1;

--8
select * from passenger,book_ticket
where book_ticket.passenger_id=passenger.p_id
order by p_id limit 3


--10
SELECT 
    c.name AS company_name,
    SUM(p.amount) AS total_revenue
FROM 
    payment p
JOIN 
    bus b ON p.bus_id = b.bus_id
JOIN 
    company c ON b.company_id = c.id
GROUP BY 
    c.name;