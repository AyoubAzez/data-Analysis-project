WITH _1990 AS (
    SELECT 
        ForestArea AS forest_area_1990,
        CountryName,
        Year
    FROM 
        forestation 
    WHERE 
        Year = 1990
),
_2016 AS (
    SELECT 
        ForestArea AS forest_area_2016,
        CountryName,
        Year
    FROM 
        forestation 
    WHERE 
        Year = 2016
)
SELECT 
    _1990.CountryName,
    _1990.forest_area_1990,
    _2016.forest_area_2016,
    round((_1990.forest_area_1990 - _2016.forest_area_2016),2) AS forest_area_loss,
   round(((_1990.forest_area_1990 - _2016.forest_area_2016)/_1990.forest_area_1990)*100,2) as percentage_of_forest_area_loss
    
FROM 
    _1990
LEFT JOIN 
    _2016
    ON _1990.CountryName = _2016.CountryName
WHERE percentage_of_forest_area_loss
ORDER BY 
   5 DESC
LIMIT 5;