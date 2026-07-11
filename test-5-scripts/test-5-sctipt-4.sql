USE warehouse_control;

SELECT 
    COALESCE(b.brand, 'No Brand') AS Brand_Name,
    SUM(t.qty) AS Quantity
FROM
    transactions t
        INNER JOIN
    products p ON t.product_id = p.id
        LEFT JOIN
    brands b ON p.brand_id = b.id
WHERE
    t.target_warehouse_id = 1
        AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
        AND t.source_warehouse_id IS NULL
GROUP BY b.brand , Brand_Name
ORDER BY Brand_Name ASC;