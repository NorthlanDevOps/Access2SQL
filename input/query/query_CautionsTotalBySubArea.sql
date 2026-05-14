SELECT "App/Cautions Total" AS Totals, Sum(CautionBySubArea.[Total Of ID]) AS [Total of ID], Sum(CautionBySubArea.Jan) AS jan, Sum(CautionBySubArea.Feb) AS feb, Sum(CautionBySubArea.Mar) AS mar, Sum(CautionBySubArea.Apr) AS apr, Sum(CautionBySubArea.May) AS may, Sum(CautionBySubArea.Jun) AS jun, Sum(CautionBySubArea.Jul) AS jul, Sum(CautionBySubArea.Aug) AS aug, Sum(CautionBySubArea.Sep) AS sep, Sum(CautionBySubArea.Oct) AS oct, Sum(CautionBySubArea.Nov) AS nov, Sum(CautionBySubArea.Dec) AS [dec]
FROM CautionBySubArea
GROUP BY "App/Cautions Total";

