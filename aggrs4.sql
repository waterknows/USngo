#Get the average rulling year of the NGOs
SELECT AVG(LEFT(Ruling, 4))
FROM NGOs;

#Get the average rulling year of the Education NGOs (NTEE=B)
SELECT AVG(LEFT(Ruling, 4))
FROM NGOs
WHERE LEFT(NTEE, 1)='B';

#Get the average rulling year of all 26 types of NGOs
SELECT AVG(LEFT(Ruling, 4)), LEFT(NTEE,1)
FROM NGOs
GROUP BY LEFT(NTEE,1);

#Get the number of NGOs of each NTEE type
SELECT Count(*), LEFT(NTEE,1)
FROM NGOs
GROUP BY LEFT(NTEE,1);

#Get the average of NGOs' rating scores
SELECT AVG(Financial), AVG(Overall), AVG(Transparency)
FROM RatedNGOs, NGOs
WHERE RatedNGOs.EIN=NGOs.EIN

#Get the average and total income of each type-ruling year(10) of NGOs
SELECT AVG(Income), SUM(Income), LEFT(NTEE,1),LEFT(Ruling,3)
FROM NGOs
GROUP BY LEFT(NTEE,1),LEFT(Ruling,3)