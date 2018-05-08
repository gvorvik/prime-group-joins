--1
SELECT * FROM "addresses"
LEFT JOIN "customers" ON "addresses"."customer_id" = "customers"."id"
ORDER BY "addresses"."id";

--2
SELECT * FROM "orders"
RIGHT JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
ORDER BY "orders"."id";

--3
SELECT "warehouse_id" (or *) FROM "warehouse_product"
WHERE "product_id" = 5;

--4
SELECT * FROM "warehouse_product"
WHERE "product_id" = 6;

--5
SELECT "customers"."first_name", "customers"."last_name", "customers"."id", COUNT(*) AS "orders"
FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "customers"."id";

--6
SELECT COUNT(*) FROM "customers";

--7
SELECT COUNT(*) FROM "products";

--8
SELECT SUM("on_hand") FROM "warehouse_product" 
WHERE "product_id" = 6;


