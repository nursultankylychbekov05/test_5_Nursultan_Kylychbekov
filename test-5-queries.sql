-- Task 1
SELECT p.product AS Product_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN products p ON t.product_id = p.id
WHERE t.target_warehouse_id = 1
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
  AND t.source_warehouse_id IS NULL
GROUP BY p.product
ORDER BY p.product ASC;

-- Task 2
SELECT p.product AS Product_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN products p ON t.product_id = p.id
WHERE t.source_warehouse_id = 1
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
  AND t.target_warehouse_id IS NULL
GROUP BY p.product
ORDER BY p.product ASC;

-- Task 3
SELECT c.category AS Category_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN products p ON t.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
WHERE t.target_warehouse_id = 1
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
  AND t.source_warehouse_id IS NULL
GROUP BY c.category
ORDER BY c.category ASC;

-- Task 4
SELECT COALESCE(b.brand, 'No Brand') AS Brand_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN products p ON t.product_id = p.id
LEFT JOIN brands b ON p.brand_id = b.id
WHERE t.target_warehouse_id = 1
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
  AND t.source_warehouse_id IS NULL
GROUP BY b.brand, Brand_Name
ORDER BY Brand_Name ASC;

-- Task 5
SELECT p.product AS Product_Name,
       SUM(CASE WHEN t.target_warehouse_id = 1 THEN t.qty ELSE 0 END) -
       SUM(CASE WHEN t.source_warehouse_id = 1 THEN t.qty ELSE 0 END) AS Quantity
FROM transactions t
INNER JOIN products p ON t.product_id = p.id
WHERE t.action_date <= '2025-12-31'
GROUP BY p.product
ORDER BY p.product ASC;

-- Task 6
SELECT p.product AS Product_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN products p ON t.product_id = p.id
WHERE t.counterparty_id = 4
  AND t.target_warehouse_id IS NOT NULL
  AND t.source_warehouse_id IS NULL
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY p.product
ORDER BY p.product ASC;

-- Task 7
SELECT p.product AS Product_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN products p ON t.product_id = p.id
WHERE t.counterparty_id = 4
  AND t.target_warehouse_id = 1
  AND t.source_warehouse_id IS NULL
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY p.product
ORDER BY p.product ASC;

-- Task 8
SELECT p.product AS Product_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN products p ON t.product_id = p.id
WHERE t.counterparty_id = 4
  AND t.source_warehouse_id = 1
  AND t.target_warehouse_id IS NULL
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY p.product
ORDER BY p.product ASC;

-- Task 9
SELECT c.counterparty_name AS Counterparty_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN counterparties c ON t.counterparty_id = c.id
WHERE t.product_id = 1
  AND t.target_warehouse_id IS NOT NULL
  AND t.source_warehouse_id IS NULL
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY c.counterparty_name
ORDER BY Quantity DESC;

-- Task 10
SELECT c.counterparty_name AS Counterparty_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN counterparties c ON t.counterparty_id = c.id
WHERE t.product_id = 1
  AND t.source_warehouse_id IS NOT NULL
  AND t.target_warehouse_id IS NULL
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY c.counterparty_name
ORDER BY Quantity DESC;

-- Task 11
SELECT p.product AS Product_Name, SUM(t.qty) AS Quantity
FROM transactions t
INNER JOIN products p ON t.product_id = p.id
WHERE t.target_warehouse_id = 2
  AND t.source_warehouse_id IS NOT NULL
  AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY p.product
ORDER BY p.product ASC;

-- Task 12
SELECT 
    p.product AS Product_Name, SUM(t.qty) AS Quantity
FROM
    transactions t
        INNER JOIN
    products p ON t.product_id = p.id
WHERE
    t.source_warehouse_id = 1
        AND t.target_warehouse_id IS NOT NULL
        AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY p.product
ORDER BY p.product ASC;