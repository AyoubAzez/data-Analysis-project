SELECT 
    COUNT(*) AS countries_with_higher_forestation
FROM 
    forestation
WHERE 
    Year = 2016
   
    AND ROUND((ForestArea / TotalLandArea) * 100, 2) > (
        SELECT 
            ROUND((ForestArea / TotalLandArea) * 100, 2)
        FROM 
            forestation
        WHERE 
            Year = 2016
            AND CountryName = 'United States'
    );
    
    select * from forestation
    