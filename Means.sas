NOTE: Copyright (c) 2016 by SAS Institute Inc., Cary, NC, USA.
NOTE: SAS (r) Proprietary Software 9.4 (TS1M7)
      Licensed to UNIVERSITY OF NORTH CAROLINA CHARLOTTE - SFA T&R, Site 70117250.
NOTE: This session is executing on the X64_DSRV19  platform.



NOTE: Analytical products:

      SAS/STAT 15.2
      SAS/ETS 15.2
      SAS/OR 15.2
      SAS/IML 15.2
      SAS/QC 15.2

NOTE: Additional host information:

 X64_DSRV19 WIN 10.0.17763  Server

NOTE: SAS initialization used:
      real time           1:05.27
      cpu time            0.99 seconds

NOTE: Unable to open SASUSER.REGSTRY. WORK.REGSTRY will be opened instead.
NOTE: All registry changes will be lost at the end of the session.
WARNING: Unable to copy SASUSER registry to WORK registry. Because of this,
WARNING: you will not see registry customizations during this session.
ERROR: Expecting page 1, got page -1 instead.
ERROR: Page validation error while reading SASUSER.PROFILE.CATALOG.
NOTE: Unable to open SASUSER.PROFILE. WORK.PROFILE will be opened instead.
NOTE: All profile changes will be lost at the end of the session.
NOTE: This SAS session is using a registry in WORK.  All changes will be lost at the end of
NOTE: this session.
NOTE: Unable to open SASUSER.PROFILE. WORK.PROFILE will be opened instead.
NOTE: All profile changes will be lost at the end of the session.

1    /* Step 1: Import the Data */
2    proc import datafile="\\apporto.com\dfs\CLT\Users\scoronad_clt\Desktop\Responses.csv"
3        out=work.results
4        dbms=csv
5        replace;
6        getnames=yes;
7    run;

8     /**********************************************************************
9     *   PRODUCT:   SAS
10    *   VERSION:   9.4
11    *   CREATOR:   External File Interface
12    *   DATE:      25NOV24
13    *   DESC:      Generated SAS Datastep Code
14    *   TEMPLATE SOURCE:  (None Specified.)
15    ***********************************************************************/
16       data WORK.RESULTS    ;
17       %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
18       infile '\\apporto.com\dfs\CLT\Users\scoronad_clt\Desktop\Responses.csv' delimiter = ','
18 !  MISSOVER DSD lrecl=32767 firstobs=2 ;
19          informat Age best32. ;
20          informat Year best32. ;
21          informat Credit_Hours best32. ;
22          informat Hours_Worked best32. ;
23          informat Hours_of_sleep best32. ;
24          informat Exersize best32. ;
25          informat Sex best32. ;
26          informat STEM best32. ;
27          informat Likert_scale best32. ;
28          format Age best12. ;
29          format Year best12. ;
30          format Credit_Hours best12. ;
31          format Hours_Worked best12. ;
32          format Hours_of_sleep best12. ;
33          format Exersize best12. ;
34          format Sex best12. ;
35          format STEM best12. ;
36          format Likert_scale best12. ;
37       input
38                   Age
39                   Year
40                   Credit_Hours
41                   Hours_Worked
42                   Hours_of_sleep
43                   Exersize
44                   Sex
45                   STEM
46                   Likert_scale
47       ;
48       if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
49       run;

NOTE: The infile '\\apporto.com\dfs\CLT\Users\scoronad_clt\Desktop\Responses.csv' is:
      Filename=\\apporto.com\dfs\CLT\Users\scoronad_clt\Desktop\Responses.csv,
      RECFM=V,LRECL=32767,File Size (bytes)=1137,
      Last Modified=25Nov2024:06:05:21,
      Create Time=25Nov2024:06:05:21

NOTE: 51 records were read from the infile
      '\\apporto.com\dfs\CLT\Users\scoronad_clt\Desktop\Responses.csv'.
      The minimum record length was 19.
      The maximum record length was 21.
NOTE: The data set WORK.RESULTS has 51 observations and 9 variables.
NOTE: DATA statement used (Total process time):
      real time           0.12 seconds
      cpu time            0.04 seconds


51 rows created in WORK.RESULTS from
\\apporto.com\dfs\CLT\Users\scoronad_clt\Desktop\Responses.csv.



NOTE: WORK.RESULTS data set was successfully created.
NOTE: The data set WORK.RESULTS has 51 observations and 9 variables.
NOTE: PROCEDURE IMPORT used (Total process time):
      real time           0.43 seconds
      cpu time            0.09 seconds


50   proc means data=work.results mean std min max;
51       var Age Year Credit_Hours Hours_Worked Hours_of_sleep Exersize;
52   run;

NOTE: Writing HTML Body file: sashtml.htm
NOTE: There were 51 observations read from the data set WORK.RESULTS.
NOTE: PROCEDURE MEANS used (Total process time):
      real time           0.37 seconds
      cpu time            0.17 seconds


