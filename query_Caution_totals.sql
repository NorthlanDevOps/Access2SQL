SELECT "App/Cautions Total" AS Totals, Sum([Caution_Crosstab Query].[Total Of ID]) AS ctotal, Sum([Caution_Crosstab Query].Jan1) AS cjan, Sum([Caution_Crosstab Query].Feb1) AS cfeb, Sum([Caution_Crosstab Query].Mar1) AS cmar, Sum([Caution_Crosstab Query].Apr1) AS capr, Sum([Caution_Crosstab Query].May1) AS cmay, Sum([Caution_Crosstab Query].Jun1) AS cjun, Sum([Caution_Crosstab Query].Jul1) AS cjul, Sum([Caution_Crosstab Query].Aug1) AS caug, Sum([Caution_Crosstab Query].Sep1) AS csep, Sum([Caution_Crosstab Query].Oct1) AS coct, Sum([Caution_Crosstab Query].Nov1) AS cnov, Sum([Caution_Crosstab Query].Dec1) AS cdec
FROM [Caution_Crosstab Query]
GROUP BY "App/Cautions Total";

