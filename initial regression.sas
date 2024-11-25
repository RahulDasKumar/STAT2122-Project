/* Step 1: Import the Data */
proc import datafile="\\apporto.com\dfs\CLT\Users\scoronad_clt\Desktop\Responses.csv" 
	out=work.results
	dbms=csv
	replace;
	getnames=yes;
run;

/* Step 2: Inspect the Data */
proc contents data=work.results;
run;

proc print data=work.results(obs=10); /* Preview first 10 rows */
run;

proc means data=work.results mean std min max;
	var Age Year Credit_Hours Hours_Worked Hours_of_sleep Exersize;
run;

proc freq data=work.results;
	tables Sex STEM Likert_scale;
run;

/* Step 3: Explore Relationships - Correlation and Scatterplots */
proc corr data=work.results nosimple;
	var Age Year Credit_Hours Hours_Worked Hours_of_sleep Exersize;
	with Likert_scale;
run;

proc sgscatter data=work.results;
	matrix Age Year Credit_Hours Hours_Worked Hours_of_sleep Exersize Likert_scale;
run;

/* Step 4: Build a Multiple Linear Regression Model */
proc reg data=work.results;
	model Likert_scale = Age Year Credit_Hours Hours_Worked Hours_of_sleep Exersize Sex STEM;
run;

/* Step 5: Check for Multicollinearity (VIF) */
proc reg data=work.results;
	model Likert_scale = Age Year Credit_Hours Hours_Worked Hours_of_sleep Exersize Sex STEM / vif;
run;

/* Step 6: Model Diagnostics */
proc reg data=work.results;
	model Likert_scale = Age Year Credit_Hours Hours_Worked Hours_of_sleep Exersize Sex STEM / r influence;
	plot student.*predicted. / vref=0;
	plot student.*(Age Year Credit_Hours Hours_Worked Hours_of_sleep Exersize) / vref=0;
run;
