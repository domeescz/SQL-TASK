--TASK 1,2,3
SELECT h.HandoffSK, t.[handoffid], [projectno], [sourcelanguagecode], [handoffstatename], [handoff], t.[CreatedDate] as [CreatedDate of Handoff], t.[CompletedDate] as [CompletedDate of Handoff], [wordcount] AS [Wordcount per Handoff], CASE classification
WHEN 'H' THEN 0
WHEN 'M' THEN 1
WHEN 'L' THEN 2
WHEN 'N/A' THEN 3
ELSE 'FA'
END 'Priority'
FROM Handoff as h JOIN Base as b on b.handoffsk = h.HandoffSK  JOIN Tasks as t on h.HandoffID = t.handoffid WHERE handoffstatename <> 'Canceled'


--bonus task
--1. bonus task
SELECT COUNT(*) AS [TOTAL COUNT], (SELECT COUNT(sourcelanguagecode) from Base WHERE sourcelanguagecode='EN-US') as [EN-US COUNT],(SELECT COUNT(sourcelanguagecode) FROM Base WHERE sourcelanguagecode = 'EN-US')*100.0/COUNT(*) as [% of EN-US]  from Base
--2. bonus task
SELECT handoffid FROM Handoff WHERE iscurrent <> 1