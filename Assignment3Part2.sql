Create database ExcerciseDb
use ExcerciseDb
create Table Products
(
PID int primary key,
PQ nvarchar(50) ,
PPrice float,
Discount float,
)
INSERT INTO Products VALUES (1, 'Television', 56600, 10)
INSERT INTO Products VALUES (2, 'Mobile', 34500, 15)
INSERT INTO Products VALUES (3, 'laptop ', 85000, 5)
CREATE FUNCTION CalculateDiscountedValue  --function
(
@price FLOAT,
 @discount FLOAT) --paasing Parameters
RETURNS FLOAT    --Return Type
AS
BEGIN
    DECLARE @discountedValue FLOAT; --Discounted Value
    SET @discountedValue = @price - (@price * @discount / 100);
    RETURN @discountedValue;
END;
SELECT  PID,PPrice,Discount,dbo.CalculateDiscountedValue(PPrice, Discount) AS DiscountedPrice
FROM Products;