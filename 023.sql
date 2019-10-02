/*Please add ; after each select statement*/
CREATE PROCEDURE marketReport()
BEGIN
    SELECT 
        dataCountries.country, dataCountries.competitors
    FROM (  
        SELECT 
            country,
            COUNT(*) as competitors
        FROM 
            foreignCompetitors 
        GROUP BY 
            country
        ORDER BY 
            country ASC
    ) dataCountries
    UNION 
    SELECT 'Total:' as country, SUM(dataReport.competitors) as competitors FROM (
        SELECT country, COUNT(*) as competitors FROM foreignCompetitors GROUP BY country
    ) as dataReport;
END