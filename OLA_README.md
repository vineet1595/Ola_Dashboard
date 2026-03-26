# 🚖 Ola Ride Analytics — End-to-End Data Analytics Project

![SQL](https://img.shields.io/badge/SQL-MySQL-blue?logo=mysql) ![Power BI](https://img.shields.io/badge/PowerBI-Dashboard-yellow?logo=powerbi) ![Excel](https://img.shields.io/badge/Excel-Data%20Cleaning-green?logo=microsoftexcel)

---

## 📌 Problem Statement

Ride-hailing platforms like Ola generate massive volumes of operational data every day — covering bookings, cancellations, driver behavior, customer feedback, and payment transactions. Without structured analysis, this data remains untapped and offers no actionable insight.

**The core business challenges addressed in this project are:**

- 📉 **High Cancellation Rates** — Understanding *why* customers and drivers cancel rides, and at what frequency.
- 💰 **Revenue Leakage** — Identifying which payment methods, vehicle types, and customer segments drive the most revenue.
- ⭐ **Service Quality Gaps** — Measuring driver and customer ratings across vehicle types to detect underperforming segments.
- 🚗 **Vehicle Utilization** — Analyzing average ride distances per vehicle type to optimize fleet deployment.
- 📊 **Operational Visibility** — Providing stakeholders with a real-time, interactive dashboard to monitor KPIs without writing manual queries.

---

## 🎯 Project Objective

To design and build a **complete analytics project** — from raw data cleaning to SQL-based querying and an interactive Power BI dashboard — that enables data-driven decision-making for an urban ride-hailing business.

---

## 📂 Dataset Overview

| Property | Details |
|---|---|
| **Total Records** | 1,00,000+ daily booking entries |
| **Total Columns** | 19 |
| **Source Format** | CSV |
| **Tool for Cleaning** | Microsoft Excel |

### Key Columns

| Column | Description |
|---|---|
| `Booking_ID` | Unique identifier for each ride booking |
| `Booking_Status` | Status of booking — Success, Cancelled by Customer, Cancelled by Driver |
| `Customer_ID` | Unique customer identifier |
| `Vehicle_Type` | Type of vehicle — Auto, Bike, Sedan, Prime, Mini |
| `Ride_Distance` | Distance covered in the ride (km) |
| `Booking_Value` | Fare amount for the ride |
| `Driver_Rating` | Rating given to the driver post-ride |
| `Customer_Rating` | Rating given to the customer by the driver |
| `Payment_Method` | Mode of payment — UPI, Cash, Card |
| `Incomplete_Ride` | Whether the ride was incomplete (Yes / No) |
| `Cancel_Reason` | Reason provided for cancellation |
| `Pickup / Drop Location` | Source and destination of the ride |
| `Timestamp` | Date and time of the booking |

---

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| **Microsoft Excel** | Data cleaning — removing duplicates, trimming whitespaces, formatting |
| **MySQL** | Data querying, analysis, and creating reusable SQL Views |
| **Power BI** | Interactive dashboard design and DAX-based calculations |

---

## 🗄️ SQL Analysis

### Views Created
SQL Views were created for each business question to allow fast, reusable access to query results without rewriting logic.

### Queries Addressed

| # | Business Question | SQL Approach |
|---|---|---|
| 1 | Retrieve all successful bookings | `WHERE booking_status = 'Success'` |
| 2 | Average ride distance per vehicle type | `AVG(ride_distance) GROUP BY vehicle_type` |
| 3 | Total rides cancelled by customers | `COUNT WHERE status = 'Cancelled by Customer'` |
| 4 | Top 5 customers by number of rides booked | `COUNT GROUP BY customer_id ORDER BY DESC LIMIT 5` |
| 5 | Driver cancellations due to personal/car issues | `WHERE cancel_reason LIKE '%personal%'` |
| 6 | Max and Min driver ratings (Prime Sedan) | `MAX(driver_rating), MIN(driver_rating)` |
| 7 | All rides paid via UPI | `WHERE payment_method = 'UPI'` |
| 8 | Average customer rating per vehicle type | `AVG(customer_rating) GROUP BY vehicle_type` |
| 9 | Total booking value of all completed rides | `SUM(booking_value) WHERE status = 'Success'` |
| 10 | List of incomplete rides with reasons | `WHERE incomplete_ride = 'Yes'` |

```sql
-- Example: Top 5 Customers by Bookings
SELECT customer_id, COUNT(booking_id) AS total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

-- Example: Average Ride Distance by Vehicle Type
SELECT vehicle_type, ROUND(AVG(ride_distance), 2) AS avg_distance
FROM bookings
GROUP BY vehicle_type;

-- Example: Cancellation Rate View
CREATE VIEW cancellation_summary AS
SELECT booking_status, COUNT(*) AS total
FROM bookings
GROUP BY booking_status;
```

---

## 📊 Power BI Dashboard

The dashboard is divided into **5 interactive pages**, each focused on a distinct business area:

| Page | Name | Key Visuals |
|---|---|---|
| 1 | **Overall** | Ride volume trend (Line Chart), Booking Status breakdown (Pie Chart), Total Bookings KPI card |
| 2 | **Vehicle Type** | Top 5 vehicle types, Avg ride distance by vehicle, Booking value cards |
| 3 | **Revenue** | Revenue by payment method (Column Chart), Ride distance distribution |
| 4 | **Cancellations** | Customer vs Driver cancellation ratio (Pie Chart), Cancellation Rate DAX measure |
| 5 | **Ratings** | Avg Driver & Customer ratings by vehicle type, interactive slicers |

### DAX Measure — Cancellation Rate
```DAX
Cancellation Rate =
DIVIDE(
    COUNTROWS(FILTER(bookings, bookings[Booking_Status] <> "Success")),
    COUNTROWS(bookings),
    0
) * 100
```

### Dashboard Features
- 🔘 **Page Navigation Buttons** for seamless user experience
- 🎛️ **Slicers** for filtering by date, vehicle type, and payment method
- 📈 **Charts used** — Line, Pie, Column, and KPI Cards
- ⚡ **Dynamic filtering** via DAX calculated measures

---

## 💡 Key Insights

- Cancellation rates vary significantly between customer-initiated and driver-initiated cancellations, pointing to different root causes that require separate interventions.
- UPI is the dominant payment method, making it a critical channel for revenue reliability.
- Prime and Sedan vehicle types show higher average ride distances, indicating longer, higher-value trips.
- Driver ratings differ across vehicle categories, highlighting service consistency gaps in certain segments.
- A small group of repeat customers account for a disproportionately high share of total bookings — a strong signal for loyalty program targeting.

---

## 📁 Project Structure

```
ola-data-analytics/
│
├── data/
│   └── ola_bookings.csv          # Cleaned dataset
│
├── sql/
│   └── ola_queries.sql           # All SQL queries and views
│
├── powerbi/
│   └── ola_dashboard.pbix        # Power BI dashboard file
│
└── README.md
```

---

## 🚀 How to Run This Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/ola-data-analytics.git
   ```

2. **Import the dataset** — Load `ola_bookings.csv` into MySQL using the import wizard or command line.

3. **Run SQL queries** — Execute `ola_queries.sql` in MySQL Workbench to create views and explore results.

4. **Open Power BI dashboard** — Open `ola_dashboard.pbix` in Power BI Desktop and connect it to your local MySQL database or import the CSV directly.

---

## 📬 Connect With Me

If you found this project useful or have feedback, feel free to connect!

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://linkedin.com/in/your-profile)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/your-username)

---

> ⭐ *If this project helped you, consider starring the repository!*
