USE warehouse_control;

SELECT 
    p.product AS Product_Name,
    SUM(CASE
        WHEN t.target_warehouse_id = 1 THEN t.qty
        ELSE 0
    END) - SUM(CASE
        WHEN t.source_warehouse_id = 1 THEN t.qty
        ELSE 0
    END) AS Quantity
FROM
    transactions t
        INNER JOIN
    products p ON t.product_id = p.id
WHERE
    t.action_date <= '2025-12-31'
GROUP BY p.product
ORDER BY p.product ASC;