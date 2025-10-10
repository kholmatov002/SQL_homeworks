-- Lesson - 17. Practise





-- Task-1.
WITH Regions AS 
(
		SELECT DISTINCT Region
		FROM #regionsales
),
     Distributors AS 
(
		SELECT DISTINCT Distributor
		FROM #regionsales
)

SELECT 
    d.Distributor,
    r.Region,
    COALESCE(SUM(s.Sales), 0) AS TotalSales
FROM Distributors d
CROSS JOIN Regions r
LEFT JOIN #regionsales s
       ON s.Distributor = d.Distributor
      AND s.Region = r.Region
GROUP BY d.Distributor, r.Region
ORDER BY d.Distributor, r.Region;

select * from #regionsales
-- Task-2.
SELECT 
    m.id AS manager_id,
    m.name AS manager_name,
    COUNT(e.id) AS direct_reports
FROM Employee m
JOIN Employee e 
     ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(e.id) >= 5;	


-- Task-3.
WITH FebOrders AS 
(
		SELECT 
			o.product_id,
			SUM(o.unit) AS total_units
		FROM Orders o
		WHERE o.order_date >= '2020-02-01'
		  AND o.order_date < '2020-03-01'
		GROUP BY o.product_id
)
SELECT 
    p.product_name,
    f.total_units
FROM FebOrders f
JOIN Products p 
    ON p.product_id = f.product_id
WHERE f.total_units >= 100;


-- Task-4.
WITH VendorCounts AS 
(
    SELECT 
        CustomerID,
        Vendor,
        COUNT(*) AS order_count,
        ROW_NUMBER() OVER 
						(
							PARTITION BY CustomerID 
							ORDER BY COUNT(*) DESC
						) AS rn
    FROM Orders
    GROUP BY CustomerID, Vendor
)
SELECT CustomerID, Vendor, order_count
FROM VendorCounts
WHERE rn = 1;


-- Task-5.


-- Task-6.

WITH SignalCounts AS (
    SELECT 
        Device_id,
        Locations,
        COUNT(*) AS signal_count
    FROM Device
    GROUP BY Device_id, Locations
),
RankedSignals AS (
    SELECT 
        Device_id,
        Locations,
        signal_count,
        ROW_NUMBER() OVER (PARTITION BY Device_id ORDER BY signal_count DESC) AS rn
    FROM SignalCounts
)
SELECT 
    d.Device_id,
    COUNT(DISTINCT dv.Locations) AS num_locations,
    MAX(d.total_signals) AS total_signals,
    r.Locations AS top_location,
    r.signal_count AS top_location_signals
FROM Device dv
JOIN (
    SELECT Device_id, SUM(signal_count) AS total_signals
    FROM SignalCounts
    GROUP BY Device_id
) d ON dv.Device_id = d.Device_id
JOIN RankedSignals r ON dv.Device_id = r.Device_id AND r.rn = 1
GROUP BY d.Device_id, r.Locations, r.signal_count;


-- Task-7.
SELECT EmpID, EmpName, Salary
FROM Employee e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE DeptID = e.DeptID
)


-- Task-8.
SELECT 
    SUM(
        CASE 
            WHEN MatchCount = TotalWinning THEN 100  -- all winning numbers matched
            WHEN MatchCount > 0 THEN 10              -- some matched
            ELSE 0
        END
    ) AS Total_Winnings
FROM (
    SELECT 
        TicketID,
        COUNT(*) AS MatchCount,
        (SELECT COUNT(*) FROM Numbers) AS TotalWinning
    FROM Tickets
    WHERE Number IN (SELECT Number FROM Numbers)
    GROUP BY TicketID
) AS MatchSummary


-- Task-9.
SELECT 
    Spend_date,
    PlatformType,
    COUNT(DISTINCT User_id) AS total_users,
    SUM(Amount) AS total_amount
FROM (
    SELECT 
        s.Spend_date,
        s.User_id,
        SUM(s.Amount) AS Amount,
        CASE 
            WHEN COUNT(DISTINCT Platform) = 2 THEN 'Both'
            WHEN MAX(Platform) = 'Mobile' THEN 'Mobile'
            ELSE 'Desktop'
        END AS PlatformType
    FROM Spending s
    GROUP BY s.Spend_date, s.User_id
) AS t
GROUP BY Spend_date, PlatformType
ORDER BY Spend_date, PlatformType;


-- Task-10.
WITH RECURSIVE Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < (SELECT MAX(Quantity) FROM Grouped)
)
SELECT 
    g.Product,
    1 AS Quantity
FROM 
    Grouped g
JOIN 
    Numbers n ON n <= g.Quantity
ORDER BY 
    g.Product;

