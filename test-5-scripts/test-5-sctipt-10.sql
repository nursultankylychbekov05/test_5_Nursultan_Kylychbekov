USE warehouse_control;

SELECT 
    c.counterparty_name AS Counterparty_Name,
    SUM(t.qty) AS Quantity
FROM
    transactions t
        INNER JOIN
    counterparties c ON t.counterparty_id = c.id
WHERE
    t.product_id = 1
        AND t.source_warehouse_id IS NOT NULL
        AND t.target_warehouse_id IS NULL
        AND t.action_date BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY c.counterparty_name
ORDER BY Quantity DESC;