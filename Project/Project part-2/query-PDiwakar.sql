-- 1
Select * from VOTER 
Where FIRST_NAME = 'SMITH' AND LAST_NAME = 'TAILOR' AND HOME_ADDRESS = '123, 100TH ST, SANTA CLARA'
;

-- 2
Select * from VOTER
Where FIRST_NAME like 'SMI%'
;

-- 3
Select * from VOTER
Where BIRTH_DATE >= TO_DATE('1980/01/01', 'yyyy/mm/dd')
AND BIRTH_DATE <= TO_DATE ('1990/12/31', 'yyyy/mm/dd')
;

-- 4
Select v.FIRST_NAME , v.LAST_NAME, c.Description 
from 
VOTER v 
JOIN VOTER_CATEGORY vc on v.VOTER_ID = vc.VOTER_ID
JOIN CATEGORY c on vc.CATEGORY_ID = c.CATEGORY_ID
;

-- 5
SELECT C.NAME,C.PARTY, P.DESCRIPTION 
FROM CANDIDATE C
JOIN CANDIDATE_PROPOSITION CP ON C.CANDIDATE_ID = CP.CANDIDATE_ID
JOIN PROPOSITION P ON P.PROPOSITION_ID = CP.PROPOSITION_ID
WHERE P.DESCRIPTION = 'The right to bear arms shall be clarified and enhanced';

-- 6
SELECT V.FIRST_NAME, V.LAST_NAME, V.BIRTH_DATE, V.PARTY_AFFILIATION
FROM VOTER V
JOIN VOTER_PROPOSITION VP ON VP.VOTER_ID = V.VOTER_ID
JOIN PROPOSITION P ON P.PROPOSITION_ID = VP.PROPOSITION_ID
WHERE P.DESCRIPTION = 'Any agency that seizes cash without a court order shall be guilty of a felony'
;

-- 7
Select p.description, COUNT (vp.VOTER_ID) AS NumberOfSupporters
FROM 
Voter_Proposition vp 
Join Proposition p on p.Proposition_ID = vp.Proposition_ID
Group By p.description
;

-- 8
Select SUM (Amount)
From Vendor_Payment 
Where Payment_Date >= TO_DATE('2015/11/01', 'yyyy/mm/dd')
AND Payment_date <= TO_DATE ('2015/11/30', 'yyyy/mm/dd')
;

-- 9
Select name, SUM (Amount)
From Vendor_Payment 
Where Payment_Date >= TO_DATE('2015/11/01', 'yyyy/mm/dd')
AND Payment_date <= TO_DATE ('2015/11/30', 'yyyy/mm/dd')
group by name
;

-- 10
Select Staffer_Name, Contact_Phone
From Staff_Itinerary
Where Location = 'California' AND Event_Time = TO_DATE('2015/11/15 08:00:00', 'YYYY/MM/DD HH:MI:SS')
;

-- 11
Select v.Voter_Id, v.First_Name, v.Last_Name, SUM (d.Amount)
From Voter v
Join Donation d on v.Voter_Id = d.Voter_Id
Group By v.Voter_Id, v.First_Name, v.Last_Name
Having SUM(d.Amount) > 500
;

-- 12
Update Donor Set Potential_Large_Donor_Flag = 'Y'
Where Voter_ID IN
(           
Select v.Voter_Id
From Voter v
Join Donation d on v.Voter_Id = d.Voter_Id
Group By v.Voter_Id
Having SUM(d.Amount) > 500
);

-- 13
-- For a voter with ID 1 that supports proposition P2
Insert Into Voter_Proposition (VOTER_ID, PROPOSITION_ID)
VALUES (1, 'P2');

-- 14
-- For a Donor 88992 that is related to voter with ID 2
Insert into Donor_RelationShip (Donor_Id, RELATED_VOTER_ID) Values ('88992', 2);





