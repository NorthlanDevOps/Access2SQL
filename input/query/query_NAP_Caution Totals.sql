SELECT "NPA/App/Caution Totals" AS [NPA/Caution Totals], [ctotal]+[total of id] AS total, [cjan]+[jan1] AS jan, [cfeb]+[feb1] AS feb, [cmar]+[mar1] AS mar, [capr]+[apr1] AS apr, [cmay]+[may1] AS may, [cjun]+[jun1] AS jun, [cjul]+[jul1] AS jul, [caug]+[aug1] AS aug, [csep]+[sep1] AS sep, [coct]+[oct1] AS oct, [cnov]+[nov1] AS nov, [cdec]+[dec1] AS [dec]
FROM Caution_totals, [NPA_Crosstab Query];

