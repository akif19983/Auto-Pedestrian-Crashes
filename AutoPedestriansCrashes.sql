-- Master raw table

Select*
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')

-- Yearly total number of crash

Select [Crash Year], COUNT([Crash Year]) as YearlyCrash
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
Group by [Crash Year]
Order by [Crash Year] desc

-- What day has the most number of crash

Select [Day of Week], COUNT([Day of Week]) as DayCrash
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
Group by [Day of Week]
Order by DayCrash desc

-- Hit and run cases and not hit and run cases

Select [Crash: Hit-and-Run], COUNT([Crash: Hit-and-Run]) as CrashCases
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
Group by [Crash: Hit-and-Run]

-- To know the relationship of lighting conditions

Select [Lighting Conditions], COUNT([Lighting Conditions]) as TotalCrashinLightingConditions
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
	and [Lighting Conditions] NOT IN('Other / unknown', 'Unknown', 'Uncoded & errors')
Group by [Lighting Conditions]
Order by TotalCrashinLightingConditions desc

-- To classify the age gender

With ChildCrashes(AgeCategory, TotalNumberofCrash)
as
(
Select [Person Age], COUNT([Person Age]) as Child
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
	and [Person Age] <= 16
Group by [Person Age]
)
Select SUM(TotalNumberofCrash) as ChildCrashes
From ChildCrashes

With YoungAdults(AgeCategory, TotalNumberofCrash)
as
(
Select [Person Age], COUNT([Person Age]) as YoungAdults
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
	and [Person Age] between 17 and 30
Group by [Person Age]
)
Select SUM(TotalNumberofCrash) as YoungAdultsCrashes
From YoungAdults

With MiddleAgedAdults(AgeCategory, TotalNumberofCrash)
as
(
Select [Person Age], COUNT([Person Age]) as MiddleAgedAdults
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
	and [Person Age] between 31 and 45
Group by [Person Age]
)
Select SUM(TotalNumberofCrash) as MiddleAgedAdultsCrashes
From MiddleAgedAdults

With OldAgedAdults(AgeCategory, TotalNumberofCrash)
as
(
Select [Person Age], COUNT([Person Age]) as OldAgedAdults
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
	and [Person Age] >= 45
Group by [Person Age]
)
Select SUM(TotalNumberofCrash) as OldAgedAdults
From OldAgedAdults

-- Location of crashes

Select TOP (10) [City or Township], COUNT([City or Township]) as TotalCrashbyLocation
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
Group by [City or Township]
Order by TotalCrashbyLocation desc

-- Relationship between weather and crashes (need to filter out that has no wheather conditions

Select [Weather Conditions (2016+)], COUNT([Weather Conditions (2016+)]) as TotalNumberofCrashes
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
	and	[Weather Conditions (2016+)] Not IN ('Uncoded & errors', 'Unknown')
Group by [Weather Conditions (2016+)]
Order by TotalNumberofCrashes

-- Total injury cases

Select [Worst Injury in Crash], COUNT([Worst Injury in Crash]) as TotalInjuryinCrash
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
Group by [Worst Injury in Crash] 
Order by TotalInjuryinCrash desc

-- Total Gender

Select [Person Gender], COUNT([Person Gender]) as TotalCrashesbasedonGender
From AutoPedestrianCrashes..ped_crashes$
Where [Person Age] Not IN ('DOB invalid', 'Less than 1 year old')
		and [Person Gender] <>  'Uncoded & errors'
Group by [Person Gender]






