USE warehouse_control;

SELECT 
    c.category AS Category_Name, SUM(t.qty) AS Quantity
FROM
    transactions t
        INNER JOIN
    products p ON t.product_id = p.id
        INNER JOIN
    categories c ON p.category_id = c.id
WHERE
    t.target_warehouse_id = 1
        AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
        AND t.source_warehouse_id IS NULL
GROUP BY c.category
ORDER BY c.category ASC;