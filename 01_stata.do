capture log close
log using "01_stata", replace
//_1
use sample_data.dta
//_2
import delimited using sample_data.csv, clear
//_3
clear all
//_4
sysuse nlsw88
//_5
describe
//_6
sum age
//_7
sum age, detail
//_8
tabstat age, stat(mean sd median iqr)
//_9
gen weekly_wage = wage * hours
//_10
label variable weekly_wage "weekly wage (estimate)"
//_11
gen foo = (age)^2
replace foo = 0
//_12
drop foo
//_13
count
//_14
count if south == 1
//_15
tabulate c_city
//_16
tabulate c_city union
//_17
set scheme s2mono, permanently
//_18
hist wage
graph export hist_wage.png, width(2000) replace
//_19
scatter weekly_wage grade
graph export edu_wage.png, width(1800) replace
//_20
scatter weekly_wage grade, mcolor(%30)
graph export edu_wage_alpha.png, width(1800) replace
//_21
hist wage if race == "black":racelbl
graph export wage_blk.png, width(2000) replace
//_22
graph box wage, over(race)
graph export race_wage.png, width(2000) replace
//_23
scatter weekly_wage grade if race == "black":racelbl, /// 
   title("Black Women") name(blk_edu_wage, replace) 
scatter weekly_wage grade if race == "white":racelbl, ///
   title("White Women") name(wht_edu_wage, replace)
graph combine blk_edu_wage wht_edu_wage, ysize(2) xsize(3)
graph export race_edu_wage.png, width(2000) replace
//_^
log close
