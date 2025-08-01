create Database Ola;
Use ola;
select * from bookings;
ALTER TABLE bookings
	CHANGE `booking_id` Booking_ID VARCHAR(255),
  CHANGE `Vehicle Type` vehicle_type VARCHAR(255),
  CHANGE `Pickup Location` pickup_location VARCHAR(255),
  CHANGE `Drop Location` drop_location VARCHAR(255),
  CHANGE `Avg VTAT` avg_vtat INT,
  CHANGE `Avg CTAT` avg_ctat INT,
  CHANGE `Cancelled Rides by Customer` cancelled_by_customer TINYINT(1),
  CHANGE `Reason for cancelling by Customer` cancel_reason_customer VARCHAR(255),
  CHANGE `Cancelled Rides by Driver` cancelled_by_driver TINYINT(1),
  CHANGE `Reason for cancelling by Driver` cancel_reason_driver VARCHAR(255),
  CHANGE `Incomplete Rides` incomplete_rides TINYINT(1),
  CHANGE `Incomplete Rides Reason` incomplete_reason VARCHAR(255),
  CHANGE `Booking Value` booking_value INT,
  CHANGE `Ride Distance` ride_distance FLOAT,
  CHANGE `Driver Ratings` driver_rating DECIMAL(2,1),
  CHANGE `Customer Rating` customer_rating DECIMAL(2,1),
  CHANGE `Vehicle Images` vehicle_images TEXT;
  select * from bookings;
# All Successful bookings
  create view Successful_Bookings as
  select * from bookings
  where Booking_Status = "success";
  select * from Successful_Bookings;
# Average ride distance for each ride
Create view ride_distance_each_ride as
select vehicle_type, avg(ride_distance)
from bookings
group by vehicle_type;  
select * from ride_distance_each_ride;
# cancelled ride by customers
Create view cancelled_by_customers as
select count(*) as cancelled_by_customer from bookings 
where booking_status = "cancelled by customer";
select * from cancelled_by_customers;
# Top 5 Customers who booked highest no of rides
create view Top_5_customers as 
select customer_id, count(booking_id) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;
select * from Top_5_customers;
# Cancelled by driver due to personal or car related issue
create view cancelled_by_driver_P_C_issue as
select count(*) from bookings
where cancel_reason_driver = 'Personal & Car related issues';
select * from cancelled_by_driver_P_C_issue;
# Max and Min driver ratings for Prime sedan bookings
Create view max_min_driver_rating as
select max(driver_rating) as max_rating,
min(driver_rating) as min_rating
from bookings where vehicle_type = 'Prime Sedan';
select * from max_min_driver_rating;
# average customer rating per vehicle type
create view Avg_cust_rating as 
select vehicle_type, avg(customer_rating) as avg_customer_rating
from bookings
group by vehicle_type;
select * from Avg_cust_rating;
# Total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(booking_value) as total_successful_ride_value
from bookings
where booking_status = 'success';
select * from total_successful_ride_value;
# All incomplete ride with reason
create view incomplete_ride_reason as
select booking_id, incomplete_reason
from bookings
where incomplete_rides = 1;
select * from incomplete_ride_reason;
