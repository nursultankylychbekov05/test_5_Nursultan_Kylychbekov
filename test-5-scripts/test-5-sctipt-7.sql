USE warehouse_control;

SELECT 
    p.product AS Product_Name, SUM(t.qty) AS Quantity
FROM
    transactions t
        INNER JOIN
    products p ON t.product_id = p.id
WHERE
    t.counterparty_id = 4
        AND t.target_warehouse_id = 1
        AND t.source_warehouse_id IS NULL
        AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY p.product
ORDER BY p.product ASC;