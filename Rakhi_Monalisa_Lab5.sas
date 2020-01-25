data GBSG2;
infile '/folders/myfolders/GBSG2.dat' expandtabs;
input id onhorm $ age menstat $ tsize tgrade $ pnodes progrec
estrec time status;
horm=onhorm='yes';
mnths=time/30.5;
run;
proc phreg data=GBSG2;
class menstat tgrade;
model mnths*status(0)=horm age menstat tsize tgrade pnodes
estrec / rl;
run;
/*
The results show that the hazard of death for patients having the 
hormonal therapy is estimated to be 0.705 times the hazard of 
death for patients not having the treatment with a 95% confidence interval of
[0.55,0.91]. And having a tumour of grade I implies a 
hazard of death of between 0.22 and 0.63 of the hazard for a patient with a tumour of grade
 III. But, as in multiple regression, 
interpreting coefficients in this way in 
the search for explanatory variables that we can remove from the model is 
problematic because of the probable lack of independence of the explanatory 
variables; dropping one particular explanatory variable, for example.
*/

