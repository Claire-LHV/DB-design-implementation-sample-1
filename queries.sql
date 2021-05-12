-- QUESTION 1 
-- ActualCost for each campaign = consumables + studio booking cost + staff time cost + advert cost

-- looking at studio booking cost
-- view all bookings and their cost

CREATE VIEW StudioBookingView AS 
SELECT CampaignID, HourlyBookingPrice, Duration
FROM RequiresBookingAt 
	INNER JOIN Advert
		ON RequiresBookingAt.AdvertID = Advert.AdvertID
	INNER JOIN Studio
		ON RequiresBookingAt.StudioID = Studio.StudioID;
	
-- view booking cost by campaign  
    
CREATE VIEW StudioCostView AS 
SELECT CampaignID, SUM(HourlyBookingPrice*Duration) AS StudioCost
FROM StudioBookingView
GROUP BY CampaignID;


-- looking at staff cost
-- for simplicity, all CurrentStatus in Holds are Ongoing.	
-- So, this view doesn't take into account the complicated situations where CurrentStatus change in Holds.
CREATE VIEW StaffTimesheetView AS 
SELECT Campaign_CampaignID AS CampaignID, WorkedHour, HourlyRate
FROM Holds  
	INNER JOIN Timesheet
		ON Holds.StaffID = Timesheet.Staff_StaffID
	INNER JOIN SalaryGrade
		ON Holds.SalaryGradeNo = SalaryGrade.SalaryGradeNo;


CREATE VIEW StaffCostView AS 
SELECT CampaignID, SUM(HourlyRate*WorkedHour) AS StaffCost
FROM StaffTimesheetView
GROUP BY CampaignID;        

        
-- looking at Advert cost
CREATE VIEW AdvertCostView AS 
SELECT Campaign.CampaignID, SUM(Cost) AS AdvertCost
FROM Campaign, Advert
WHERE Campaign.CampaignID = Advert.CampaignID
GROUP BY CampaignID;     
        
        
-- VIEW ALL actual cost = consumables + studio booking cost + staff time cost + advert cost	
CREATE VIEW InvoiceView AS 
SELECT 
	Campaign.CampaignID,
    Title,
    Theme,
    EstimatedCost,
    CostOfConsumable + coalesce(StudioCost, 0) + coalesce(StaffCost, 0) + coalesce(AdvertCost, 0) AS ActualCost
FROM Campaign 
	NATURAL JOIN StudioCostView 
    NATURAL JOIN StaffCostView 
    NATURAL JOIN AdvertCostView
;




-- Campaign that have actual cost less than the average estimated cost
SELECT Title, Theme 
FROM InvoiceView
WHERE ActualCost  < (SELECT AVG(EstimatedCost) FROM Campaign);



-- QUESTION 2
SELECT Title, COUNT(AdvertID) 'Number of Adverts'
FROM Campaign, Advert 
WHERE Campaign.CampaignID = Advert.CampaignID
	AND ActualCompletionDate < EstimatedCompletionDate
GROUP BY Campaign.CampaignID;


-- QUESTION 3
-- This query is edited on 10/05/20201
select staffname
from fulltimestaff natural join staff natural join workson natural join campaign 
where CampaignManagerStaffID != SupervisorStaffID;


-- QUESTION 4

SELECT Title 'Campaign title', COUNT(*) 'Number of Staff having salary grade >2' 
FROM Campaign NATURAL JOIN WorksOn NATURAL JOIN Staff INNER JOIN Holds
	on staff.StaffID = Holds.StaffID
WHERE Campaign.CampaignID IN (SELECT CampaignID FROM WorksOn GROUP BY CampaignID HAVING COUNT(*) >2)
	AND SalaryGradeNo >2
GROUP BY Campaign.CampaignID;


SELECT Title 'Campaign title', COUNT(*) 'Number of Staff having salary grade >2' 
FROM Campaign INNER JOIN WorksOn INNER JOIN Staff INNER JOIN Holds
	ON Campaign.CampaignID = WorksOn.CampaignID AND WorksOn.StaffID = Staff.StaffID AND Staff.StaffID = Holds.StaffID
WHERE Campaign.CampaignID IN (SELECT CampaignID FROM WorksOn GROUP BY CampaignID HAVING COUNT(*) >2)
	AND SalaryGradeNo >2
GROUP BY Campaign.CampaignID;


-- QUESTION 5

SELECT FulltimeStaff.StaffID, StaffName, OfficeLocation, Gender, DOB, StaffEmailAddress, StaffPhoneNo, Position, SupervisorStaffID 
FROM FulltimeStaff, Staff 
WHERE FulltimeStaff.StaffID = Staff.StaffID 
	AND FulltimeStaff.StaffID NOT IN 
		(SELECT StaffID FROM DirAccManager INNER JOIN Campaign ON DirAccManager.StaffID = Campaign.CampaignManagerStaffID);


