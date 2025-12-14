ALTER TABLE sales
ADD COLUMN order_date_clean DATE,
ADD COLUMN ship_date_clean DATE;

UPDATE sales
SET
  order_date_clean = STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
  ship_date_clean  = STR_TO_DATE(`Ship Date`, '%m/%d/%Y');
