
filename myfile = './Perceived Stress of College Students (Responses) - Form Responses 1.csv'
PROC IMPORT OUT=newdata
    DATAFILE=myfile
    DBMS=CSV
    REPLACE;
    GETNAMES=YES;
RUN;
/*
Renmaing variables for convienince 
*/
data student_data;
	set newdata (rename=(Age = age Year = year Credit_Hours = credit_hours Hours_Worked = work Hours_of_sleep = sleep Exersize = exercise Sex = sex STEM = stem Likert_scale = stress));
	run;
/*
 Running multi lin reg on all the student data
*/

proc print data = student_data;
run;
proc reg data = student_data;
	model stress = age year credit_hours work sleep exercise;
run;
/*

*/
proc reg data = student_data;
	model stress = age year sleep exercise;
run;

/*
Looking into women in stem to see any correlation
*/
data women_stem_students;
	set student_data;
	where sex = 1 and stem = 1;
run;

proc print data = women_stem_students;
run;
proc reg data = women_stem_students;
	model stress = age year credit_hours work sleep exercise;
run;



