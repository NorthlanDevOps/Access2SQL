SELECT Caution_Crosstab.Result, Caution_Crosstab.[Total Of ID], IIf([jan] Is Null,0,[jan]) AS Jan1, IIf([feb] Is Null,0,[feb]) AS Feb1, IIf([mar] Is Null,0,[mar]) AS Mar1, IIf([apr] Is Null,0,[apr]) AS Apr1, IIf([may] Is Null,0,[may]) AS May1, IIf([jun] Is Null,0,[jun]) AS Jun1, IIf([jul] Is Null,0,[jul]) AS Jul1, IIf([aug] Is Null,0,[aug]) AS Aug1, IIf([sep] Is Null,0,[sep]) AS Sep1, IIf([oct] Is Null,0,[oct]) AS Oct1, IIf([nov] Is Null,0,[nov]) AS Nov1, IIf([dec] Is Null,0,[dec]) AS Dec1
FROM Caution_Crosstab;

