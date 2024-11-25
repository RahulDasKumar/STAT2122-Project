
filename myfile = "./Perceived Stress of College Students (Responses) - Form Responses 1.csv";
PROC IMPORT OUT=newdata
    DATAFILE= myfile
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
 Performing simple linear regression on all the variables to drop insignficant ones
*/
proc reg data = student_data;
	model stress = age;
run;
proc reg data = student_data;
	model stress = year;
run;
proc reg data = student_data;
	model stress = credit_hours;
run;
proc reg data = student_data;
	model stress = work;
run;
proc reg data = student_data;
	model stress = sleep;
run;
proc reg data = student_data;
	model stress = exercise;
run;

/*
Looking into women in stem to see any correlation
*/
data women_stem_students;
	set student_data;
	where sex = 1 and stem = 1;
run;
/*
 Statsitcally significant here
*/
proc reg data = women_stem_students;
	model stress = sleep;
run;

DATA women_stem_students;
    SET women_stem_students;
	sleep_rest = sleep * year;
	credit_hours_sleep = sleep * credit_hours;
	sleep_exercise = sleep * exercise;
RUN;
/*
	Has either significant variables or approaching sigificant vairables 
*/
proc reg data = women_stem_students;
	model stress = credit_hours sleep sleep_rest credit_hours_sleep;
run;

