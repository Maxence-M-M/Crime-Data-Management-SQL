
-- list criminals and the number of crimes they each one have
Select P.person_ID,
	   P.first_name 'First Name', 
       P.last_name 'Last Name', 
       count(VC.implicated_ID) 'Suspected Committed Crime',
       count(PEN.Penalty_ID) 'Certain Committed Crime'
       
from person P 
left join victim_criminal VC on P.person_id=VC.person_id 
left join Crime CR on CR.Crime_ID=VC.Crime_ID
left join Judgement JU on JU.Crime_ID = CR.Crime_ID
left join Penalty PEN on PEN.Judgement_ID = JU.Judgement_ID
where VC.Implication_Type="Criminal"
and Ju.Date_Judgement= (select max(date_Judgement)        
			  from Judgement Jud
			  where jud.crime_ID=Ju.Crime_ID)
Group by P.person_ID;

-- list people in prison currently, end penalty
Select distinct(P.person_ID),
		P.first_name 'First Name', 
        P.last_name 'Last Name', 
        PR.name 'Prison Name',
        End_Penalty
        
from person P , victim_criminal VC, Crime CR, Prison PR, Penalty PE, Judgement JU
Where P.person_id=VC.person_id
and VC.Implication_Type="Criminal"
and CR.Crime_ID=VC.Crime_ID
and JU.Crime_ID=CR.Crime_ID
and PE.Judgement_ID=JU.Judgement_ID
and PR.Prison_ID= PE.Prison_ID
and Ju.Date_Judgement= (select max(date_Judgement)         
			  from Judgement Jud
			  where jud.crime_ID=Ju.Crime_ID) ;

-- list people with current penalties (no jail)
Select 
		distinct (P.person_ID) 'Person ID',
		P.first_name 'First Name', 
        P.last_name 'Last Name',
        CR.Crime_type "Committied crime", 
        PE.Penalty_Type "On going penalties",
        PE.description "Penalty Description",
        JU.Judgement_ID "Judgement ID", 
        Ju.Date_Judgement as "Judgement Date"

from person P , victim_criminal VC, crime CR, prison PR, penalty PE, judgement JU
Where P.person_id=VC.person_id
and VC.Implication_Type="Criminal"
and CR.Crime_ID=VC.Crime_ID
and JU.Crime_ID=CR.Crime_ID
and PE.Judgement_ID=JU.Judgement_ID
and PE.Penalty_Type != "Jail"
and Ju.Date_Judgement= (select max(date_Judgement)
			  from Judgement Jud
			  where jud.crime_ID=Ju.Crime_ID);




-- type de jugement par crime and Penalty type associated
Select CR.Crime_ID,
	CR.Crime_type as "Crime Type",
    JU.Decision as "Decision Judgemment",
    JU.Court_type as "Instance",
    PE.Penalty_Type as "Penalty Type"
From Crime as CR, Judgement as JU , Victim_Criminal as VC , penalty PE
where CR.crime_ID=JU.Crime_ID
and CR.Crime_ID = VC.Crime_ID
and PE.Judgement_ID = JU.Judgement_ID
and VC.Implication_Type = 'Criminal'
and Ju.Date_Judgement= (select max(date_Judgement)
			  from Judgement Jud
			  where jud.crime_ID=Ju.Crime_ID);
              



/* display victime and criminals and the related crime
Select p.first_name, p.last_name, CR.Crime_type
from person p
left join Victim_Criminal VC on p.person_ID=VC.person_ID
left join crime CR on VC.Crime_ID=CR.Crime_ID ;*/



-- display count prisoners by prison( nom )  , maximum capacity , taux de remplissement , avg_age_prisoneer , order by taux de remplissment asc

select PR.Prison_ID , PR.name as "Prison Name" , count(distinct(PER.Person_ID)) as "Number of People" ,
		max_capacity as "Max Capacity",
		(count(distinct(PER.Person_ID))/ max_capacity) as "Occupancy Rate",
        AVG(TIMESTAMPDIFF(YEAR, PER.birth, CURDATE())) AS "Age Average"
from prison PR 
join penalty PEN on PR.prison_ID = PEN.prison_ID
join judgement JU on JU.judgement_ID = PEN.judgement_ID
join crime CR on CR.Crime_id = JU.Crime_ID 
join victim_criminal VC on VC.Crime_ID = CR.Crime_id
join person PER on PER.Person_ID= VC.Person_ID
where end_penalty > date(now())
and Implication_Type ='Criminal'
and Ju.Date_Judgement= (select max(date_Judgement)
			  from Judgement Jud
			  where jud.crime_ID=Ju.Crime_ID)
group by PR.Prison_ID;






-- regroup case with unknown criminal and select evidence for each 

select distinct(CA.Case_ID) ,CR.Crime_ID, CA.Name , CR.Date_Crime, CR.Crime_type , E.type , E.Description
from cases CA , crime CR , evidence E ,victim_criminal VC
where CA.Case_ID = CR.Case_ID 
and CA.Case_ID= E.Case_ID
and VC.Crime_ID = CR.Crime_ID
and Person_ID is NULL
order by type , Date_Crime;




-- display case and number of crime associated 

select CA.Case_ID , CA.Name , count(CR.Crime_type)
from cases CA , crime CR
where CA.Case_ID = CR.Case_ID
group by Case_ID;

-- Open case

select CA.Case_ID, CA.Name as "Case Name", CA.Opening_Date as "Opening Date Case",
		count(CR.Crime_ID) as "Number of Crime",
        count(distinct(VC.Person_ID)) as "Number of Known Criminal"
        
from cases CA , crime CR , Victim_Criminal VC
where CA.Case_ID = CR.Case_ID
and VC.Crime_ID = CR.Crime_ID
and CA.Closing_Date is null
and VC.Implication_Type = 'Criminal'
group by CA.Case_ID;

select CA.Case_ID , CA.Name as "Case Name" , W.witness_ID , 
		PER.First_Name as "Witness First Name" , PER.Last_Name as "Witness Last Name"
from cases CA ,witness W,person PER
where  W.Case_ID = CA.Case_ID
and PER.Person_ID = W.Person_ID;


select  CA.case_ID, CA.Name as "Case Name" , CR.Crime_ID,JU.Judge  , JU.Court_Type as "Instance" ,
		Opening_Date as "Case date" , Date_Judgement as "Judgement Date" , 
		TIMESTAMPDIFF(YEAR, Opening_Date, Date_Judgement) as "Case Duration"
from cases CA
left join crime CR on CA.Case_ID = CR.Case_ID
left join Judgement JU on  JU.Crime_ID = CR.Crime_ID
and Ju.Date_Judgement= (select max(date_Judgement)
			  from Judgement Jud
			  where jud.crime_ID=Ju.Crime_ID);
              
-- 

Select P.person_ID,
	   P.first_name 'First Name', 
       P.last_name 'Last Name', 
       p.Birth , CR.Crime_ID , CR.Crime_type,
       JU.Court_Type, JU.Decision , PEN.Penalty_Type
       
from person P 
left join victim_criminal VC on P.person_id=VC.person_id 
left join Crime CR on CR.Crime_ID=VC.Crime_ID
left join Judgement JU on JU.Crime_ID = CR.Crime_ID
left join Penalty PEN on PEN.Judgement_ID = JU.Judgement_ID
where VC.Implication_Type="Criminal";


call criminal_rec_prc ("May","Ancerd");

--
call Lvl_of_Offence_PRC(4,@out_Crime_ID,@level_of_offence,@out_Crime_type);
select @out_Crime_ID as "Crime_ID",@out_Crime_type as "Crime Type",@level_of_offence as "level of Offence";


call Criminal_rec_out_prc(10,@out_first_name, @out_last_name ,@out_Birth, @out_Count_Crime_ID);
select @out_first_name as "First Name", @out_last_name as "Last Name" ,@out_Birth as "Birth",@out_Count_Crime_ID as "Number of Crimes" ;







UPDATE crime 
   SET level_of_offence = NULL ;
   
call new_procedure_crime2();

select * 
from crime;

ALTER TABLE crime
ADD level_of_offence varchar(255);


update crime
set Date_Crime = "2020-09-04"
where Crime_ID = 17;

select *
from Evidence;






select *
from crime;



alter table crime 
drop column level_of_offense ;

ALTER TABLE crime
ADD level_of_offense varchar(105);





select first_name
from employees;


select first_name , salary
from employees as E
left join salaries as S on S.emp_no=E.emp_no


              
















