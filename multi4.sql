#select ngos that has 100% expense rate programs
SELECT NGOName
FROM NGOs, Programs
WHERE ExpenseRate=100 AND
	NGOs.EIN=Programs.EIN;
    
#select ngos that are in New York
SELECT NGOName
FROM NGOs
JOIN Has 
ON NGOs.EIN=Has.EIN
JOIN ZIPs
ON Has.ZIP5=ZIPs.ZIP5
WHERE MSA1= 'New York';
    
    
#find pairs of NGOs that has same ZIP code
SELECT n1.NGOName, n2.NGOName
FROM NGOs n1, NGOs n2
WHERE n1.ZIP9=n2.ZIP9 AND
	n1.NGOname>n2.NGOName;

#find pairs of NGOs that has same Ruling year/month
SELECT n1.NGOName, n2.NGOName
FROM NGOs n1, NGOs n2
WHERE n1.Ruling=n2.Ruling AND
	n1.NGOname>n2.NGOName;


#find NGOs that has overall score>financial score    
SELECT NGOName
FROM NGOs
WHERE EIN IN
		(SELECT EIN
         FROM RatedNGOs
         WHERE Overall > Financial)

#find NGOs that has highest overall score
SELECT NGOName
FROM NGOs
WHERE EIN IN
	(SELECT EIN
	FROM RatedNGOs
	WHERE Overall>=ALL(
		SELECT Overall
		FROM RatedNGOs));
