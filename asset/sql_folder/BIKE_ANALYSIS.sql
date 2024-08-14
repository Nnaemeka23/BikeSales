SELECT 
	*
FROM
	 [bikedb].[dbo].[bike_share_yr_0];
SELECT 
	*
FROM
	 [bikedb].[dbo].[bike_share_yr_1];
SELECT 
	*
FROM
	 [bikedb].[dbo].[cost_table];


SELECT * FROM [dbo].[bike_share_yr_0]
UNION
SELECT * FROM [dbo].[bike_share_yr_1];

WITH bike_records AS (
    SELECT * FROM [dbo].[bike_share_yr_0]
    UNION
    SELECT * FROM [dbo].[bike_share_yr_1]
)
select dteday, season, bike_records.yr, mnth, hr, weekday, rider_type, riders, price, COGS, riders * price AS revenue, riders * price -COGS * riders AS profit,
((price - COGS) / price ) * 100 AS profit_margin
from bike_records
left join [dbo].[cost_table]
on bike_records.yr = [dbo].[cost_table].yr;
ALTER TABLE [dbo].[bike_records2]
ALTER COLUMN [weekday]
VARCHAR (20);
ALTER TABLE [dbo].[bike_records2]
ALTER COLUMN [revenue]
float;
ALTER TABLE [dbo].[bike_records2]
ALTER COLUMN [profit]
float;
UPDATE [dbo].[bike_records2] SET [weekday] = 
CASE
WHEN [weekday] = 0 THEN 'Sunday'
WHEN [weekday] = 1 THEN 'Monday'
WHEN [weekday] = 2 THEN 'Tuesday'
WHEN [weekday] = 3 THEN 'wednesday'
WHEN [weekday] = 4 THEN 'Thursday'
WHEN [weekday] = 5 THEN 'Friday'
WHEN [weekday] = 6 THEN 'saturday'
END;



                                                                                                        






