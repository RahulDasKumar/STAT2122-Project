/* Step 1: Import the Data */
proc import datafile="\\apporto.com\dfs\CLT\Users\scoronad_clt\Desktop\Responses.csv" 
	out=work.results
	dbms=csv
	replace;
	getnames=yes;
run;
proc freq data=work.results;
	tables Sex STEM Likert_scale;
run;
