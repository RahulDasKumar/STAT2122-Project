/* Step 1: Import the Data */
proc import datafile="\\apporto.com\dfs\CLT\Users\scoronad_clt\Desktop\Responses.csv" 
	out=work.results
	dbms=csv
	replace;
	getnames=yes;
run;

/* Step 2: Basic Data Inspection (Minimal Output) */
proc contents data=work.results varnum; /* Organizes variables by position */
run;
/* Enable Graphics */
ods graphics on;

/* Create Scatter Plots with Fit Lines for Each Predictor */
proc sgplot data=work.results;
    title "Goodness of Fit: Likert Scale vs Age";
    reg x=Age y=Likert_scale / cli; /* CLI adds confidence limits */
    xaxis label="Age";
    yaxis label="Likert Scale";
run;

proc sgplot data=work.results;
    title "Goodness of Fit: Likert Scale vs Year";
    reg x=Year y=Likert_scale / cli;
    xaxis label="Year in College";
    yaxis label="Likert Scale";
run;

proc sgplot data=work.results;
    title "Goodness of Fit: Likert Scale vs Credit Hours";
    reg x=Credit_Hours y=Likert_scale / cli;
    xaxis label="Credit Hours";
    yaxis label="Likert Scale";
run;

proc sgplot data=work.results;
    title "Goodness of Fit: Likert Scale vs Hours Worked";
    reg x=Hours_Worked y=Likert_scale / cli;
    xaxis label="Hours Worked";
    yaxis label="Likert Scale";
run;

proc sgplot data=work.results;
    title "Goodness of Fit: Likert Scale vs Hours of Sleep";
    reg x=Hours_of_sleep y=Likert_scale / cli;
    xaxis label="Hours of Sleep";
    yaxis label="Likert Scale";
run;

proc sgplot data=work.results;
    title "Goodness of Fit: Likert Scale vs Exercise Hours";
    reg x=Exersize y=Likert_scale / cli;
    xaxis label="Exercise Hours";
    yaxis label="Likert Scale";
run;

proc sgplot data=work.results;
    title "Goodness of Fit: Likert Scale vs Sex";
    reg x=Sex y=Likert_scale / cli;
    xaxis label="Sex (0-Male, 1-Female, 2-Other)";
    yaxis label="Likert Scale";
run;

proc sgplot data=work.results;
    title "Goodness of Fit: Likert Scale vs STEM";
    reg x=STEM y=Likert_scale / cli;
    xaxis label="STEM (0-Non-STEM, 1-STEM)";
    yaxis label="Likert Scale";
run;

/* Disable Graphics */
ods graphics off;
