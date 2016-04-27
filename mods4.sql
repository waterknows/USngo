SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;

#insert a NGO program
INSERT INTO `yuxiaoDB`.`Programs` (`EIN`, `Program`, `Expense`, `ExpenseRate`) VALUES ('1028397', 'Education K12', '1,000,000', '20.00%');
#insert another program for this NGO
INSERT INTO `yuxiaoDB`.`Programs` (`EIN`, `Program`, `Expense`, `ExpenseRate`) VALUES ('1028397', 'Fundrasing', '1,00,000', '10.00%');


#insert NGOs zip codes, disable all constraints
INSERT INTO `yuxiaoDB`.`Has`
SELECT DISTINCT EIN, left(ZIP9, 5)
FROM NGOs;

#insert NGOs zip codes 
INSERT INTO `yuxiaoDB`.`ZIPs`
SELECT DISTINCT left(ZIP9, 5), AssetCode, IncomeCode, FilingCode, PF
FROM NGOs
Limit 10;

#delete the record where rulling<1800
DELETE from NGOs
WHERE left(Ruling,4)<1800;

#delete the record where NTEE is null
DELETE from NGOs
WHERE NTEE is NULL;

#update 
UPDATE NGOs
SET Income = 0
WHERE Income is NULL;

UPDATE NGOs
SET Income = 100000000
WHERE Income >100000000;