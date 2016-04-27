SELECT NGOName as OrderedRichNGO
FROM NGOs
WHERE Income > 1000000
AND Asset >= 1000000
ORDER BY Income DESC;

#Subsection is a sectorial code for NGOs, group by it and to get sectorial distribution
SELECT COUNT(EIN) AS SectorialDistribution, Subsection, AVG(Income) as AverageIncome
FROM NGOs
GROUP BY Subsection;

#view 10 oldest NGOs
SELECT * 
FROM NGOs
ORDER BY Ruling
LIMIT 10;

#select NGOs with "music" in their mission statements
SELECT NGOs.NGOName as MusicinMissionNGOs, Missions.Missions
FROM Missions 
JOIN NGOs 
ON NGOs.EIN=Missions.EIN
WHERE Missions.Missions Like '%Music%';

#join multiple tables to identify NGO's MSA (pseudo data)
SELECT NGOs.NGOName, ZIPs.MSA1
FROM NGOs 
JOIN Has 
ON NGOs.EIN=Has.EIN
JOIN ZIPs
ON Has.ZIP5=ZIPs.ZIP5
ORDER BY Income DESC
LIMIT 10;

#rank NGOs by their programs expense
SELECT NGOs.NGOName, Programs.Program
FROM NGOs 
JOIN Programs 
ON NGOs.EIN=Programs.EIN
ORDER BY Programs.Expense
LIMIT 10;