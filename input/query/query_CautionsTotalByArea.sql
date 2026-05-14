SELECT "App/Cautions Total" AS Totals, Sum(CautionByArea.[Total Of ID]) AS [Total of ID], Sum(CautionByArea.Jan) AS jan, Sum(CautionByArea.Feb) AS feb, Sum(CautionByArea.Mar) AS mar, Sum(CautionByArea.Apr) AS apr, Sum(CautionByArea.May) AS may, Sum(CautionByArea.Jun) AS jun, Sum(CautionByArea.Jul) AS jul, Sum(CautionByArea.Aug) AS aug, Sum(CautionByArea.Sep) AS sep, Sum(CautionByArea.Oct) AS oct, Sum(CautionByArea.Nov) AS nov, Sum(CautionByArea.Dec) AS [dec]
FROM CautionByArea
GROUP BY "App/Cautions Total";

