* cd "..."

* ## Building Permits Survey Regressions

* # 2-unit cross-section

* Control > 2500

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large == 1
drop if pop_19 < 2500

reg two_unit_bldgs medium

predict r, resid
swilk r

estat hettest
estat imtest, white

*

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large == 1
drop if pop_19 < 2500

reg two_unit_bldgs medium pop_growth three_unit_bldgs five_unit_bldgs two_unit_bldgs_20 three_unit_bldgs_20 five_unit_bldgs_20 under_eighteen_2022 black_2022 hisp_2022 race_other_2022 median_income_2022 bach_edu_2022 pct_renter_2022, r

vif 

predict r, resid
swilk r

* Control > 5000

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large == 1
drop if pop_19 < 5000

reg two_unit_bldgs medium

predict r, resid
swilk r

estat hettest
estat imtest, white

*

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large == 1
drop if pop_19 < 5000

reg two_unit_bldgs medium pop_growth three_unit_bldgs five_unit_bldgs two_unit_bldgs_20 three_unit_bldgs_20 five_unit_bldgs_20 under_eighteen_2022 black_2022 hisp_2022 race_other_2022 median_income_2022 bach_edu_2022 pct_renter_2022

vif 

predict r, resid
swilk r

estat hettest
estat imtest, white

* Control > 7500

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large == 1
drop if pop_19 < 7500

reg two_unit_bldgs medium

predict r, resid
swilk r

estat hettest
estat imtest, white

*

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large == 1
drop if pop_19 < 7500

reg two_unit_bldgs medium pop_growth three_unit_bldgs five_unit_bldgs two_unit_bldgs_20 three_unit_bldgs_20 five_unit_bldgs_20 under_eighteen_2022 black_2022 hisp_2022 race_other_2022 median_income_2022 bach_edu_2022 pct_renter_2022

vif 

predict r, resid
swilk r

estat hettest
estat imtest, white

* # 3-4 unit cross-section 

* 5000–70000

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large21 == 1
drop if (pop_19 < 5000 | pop_19 > 80000)

reg three_unit_bldgs large, r

predict r, resid
swilk r

* 

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large21 == 1
drop if (pop_19 < 5000 | pop_19 > 80000)

reg three_unit_bldgs large pop_growth two_unit_bldgs_20 three_unit_bldgs_21 five_unit_bldgs_21 under_eighteen_2022 black_2022 hisp_2022 race_other_2022 median_income_2022 bach_edu_2022 pct_renter_2022, r

vif

predict r, resid
swilk r

* 7500–40000 

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large21 == 1
drop if (pop_19 < 7500 | pop_19 > 50000)

reg three_unit_bldgs large, r

predict r, resid
swilk r

* 

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large21 == 1
drop if (pop_19 < 7500 | pop_19 > 50000)

reg three_unit_bldgs large pop_growth two_unit_bldgs_20 three_unit_bldgs_21 five_unit_bldgs_21 under_eighteen_2022 black_2022 hisp_2022 race_other_2022 median_income_2022 bach_edu_2022 pct_renter_2022, r

vif

predict r, resid
swilk r

* 10000–40000

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large21 == 1
drop if (pop_19 < 10000 | pop_19 > 50000)

reg three_unit_bldgs large, r

predict r, resid
swilk r

* 

import delimited "data_bps_2023_per_1000.csv", clear 

drop if large21 == 1
drop if (pop_19 < 10000 | pop_19 > 50000)

reg three_unit_bldgs large pop_growth two_unit_bldgs_20 three_unit_bldgs_21 five_unit_bldgs_21 under_eighteen_2022 black_2022 hisp_2022 race_other_2022 median_income_2022 bach_edu_2022 pct_renter_2022, r

vif

predict r, resid
swilk r

* # 2-unit event study

* Control > 2500

import delimited "data_bps.csv", clear 

drop if large == 1
drop if pop_19 < 2500

gen period_p = period + 4
egen cityn = group(place)
xtset cityn period_p 

xtreg two_unit_bldgs o3.period_p#o.medium i.period_p, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.medium) omit base rename(*.period_p#*.medium="") xlabel(1 "2017" 2 "2018" 3"2019" 4 "2020" 5 "2021" 6 "2022" 7 "2023",angle(45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("Number of Two-Unit Permits Issued") xtitle("Period (Year)") level(95) ylabel(-4(1)4) yscale(r(-4,4)) name(tup2500, replace)

* 

import delimited "data_bps.csv", clear 

drop if large == 1
drop if pop_19 < 2500

gen period_p = period + 4
egen cityn = group(place)
xtset cityn period_p 

xtreg two_unit_bldgs o3.period_p#o.medium i.period_p three_unit_bldgs five_unit_bldgs, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.medium) omit base rename(*.period_p#*.medium="") xlabel(1 "2017" 2 "2018" 3"2019" 4 "2020" 5 "2021" 6 "2022" 7 "2023",angle(45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("Number of Two-Unit Permits Issued") xtitle("Period (Year)") level(95) ylabel(-4(1)4) yscale(r(-4,4)) name(tup2500con, replace)

* Control > 5000

import delimited "data_bps.csv", clear 

drop if large == 1
drop if pop_19 < 5000

gen period_p = period + 4
egen cityn = group(place)
xtset cityn period_p 

xtreg two_unit_bldgs o3.period_p#o.medium i.period_p, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.medium) omit base rename(*.period_p#*.medium="") xlabel(1 "2017" 2 "2018" 3"2019" 4 "2020" 5 "2021" 6 "2022" 7 "2023",angle(45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("Number of Two-Unit Permits Issued") xtitle("Period (Year)") level(95) ylabel(-4(1)4) yscale(r(-4,4)) name(tup5000, replace)

* 

import delimited "data_bps.csv", clear 

drop if large == 1
drop if pop_19 < 5000

gen period_p = period + 4
egen cityn = group(place)
xtset cityn period_p 

xtreg two_unit_bldgs o3.period_p#o.medium i.period_p three_unit_bldgs five_unit_bldgs, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.medium) omit base rename(*.period_p#*.medium="") xlabel(1 "2017" 2 "2018" 3"2019" 4 "2020" 5 "2021" 6 "2022" 7 "2023",angle(45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("Number of Two-Unit Permits Issued") xtitle("Period (Year)") level(95) ylabel(-4(1)4) yscale(r(-4,4)) name(tup5000con, replace)

* Control > 7500

import delimited "data_bps.csv", clear 

drop if large == 1
drop if pop_19 < 7500

gen period_p = period + 4
egen cityn = group(place)
xtset cityn period_p 

xtreg two_unit_bldgs o3.period_p#o.medium i.period_p, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.medium) omit base rename(*.period_p#*.medium="") xlabel(1 "2017" 2 "2018" 3"2019" 4 "2020" 5 "2021" 6 "2022" 7 "2023",angle(45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("Number of Two-Unit Permits Issued") xtitle("Period (Year)") level(95) ylabel(-6(1)4) yscale(r(-6,4)) name(tup7500, replace)

* 

import delimited "data_bps.csv", clear 

drop if large == 1
drop if pop_19 < 7500

gen period_p = period + 4
egen cityn = group(place)
xtset cityn period_p 

xtreg two_unit_bldgs o3.period_p#o.medium i.period_p three_unit_bldgs five_unit_bldgs, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.medium) omit base rename(*.period_p#*.medium="") xlabel(1 "2017" 2 "2018" 3"2019" 4 "2020" 5 "2021" 6 "2022" 7 "2023",angle(45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("Number of Two-Unit Permits Issued") xtitle("Period (Year)") level(95) ylabel(-6(1)4) yscale(r(-6,4)) name(tup7500con, replace)

* # 3-4 unit event study

import delimited "data_bps.csv", clear 

drop if (pop_19 < 5000 | pop_19 > 80000 | large21 == 1)

gen period_p = period + 4

egen cityn = group(place)
xtset cityn period_p 

xtreg three_unit_bldgs o4.period_p#o.large i.period_p, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.large) omit base rename(*.period_p#*.large="") xlabel(1 "2017" 2 "2018" 3"2019" 4 "2020" 5 "2021" 6 "2022" 7 "2023",angle(45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("Number of Three- and Four-Unit Permits Issued") xtitle("Period (Year)") level(95) ylabel(-2(1)2) yscale(r(-2,2)) name(fup80, replace)

* 

import delimited "data_bps.csv", clear 

drop if (pop_19 < 7500 | pop_19 > 50000 | large21 == 1)

gen period_p = period + 4

egen cityn = group(place)
xtset cityn period_p 

plot three_unit_bldgs period_p

xtreg three_unit_bldgs o4.period_p#o.large i.period_p, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.large) omit base rename(*.period_p#*.large="") xlabel(1 "2017" 2 "2018" 3"2019" 4 "2020" 5 "2021" 6 "2022" 7 "2023",angle(45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("Number of Three- and Four-Unit Permits Issued") xtitle("Period (Year)") level(95) ylabel(-2(1)2) yscale(r(-2,2)) name(fup50, replace)

* 

import delimited "data_bps.csv", clear 

drop if (pop_19 < 10000 | pop_19 > 50000 | large21 == 1)

gen period_p = period + 4

egen cityn = group(place)
xtset cityn period_p 

xtreg three_unit_bldgs o4.period_p#o.large i.period_p, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.large) omit base rename(*.period_p#*.large="") xlabel(1 "2017" 2 "2018" 3"2019" 4 "2020" 5 "2021" 6 "2022" 7 "2023",angle(45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("Number of Three- and Four-Unit Permits Issued") xtitle("Period (Year)") level(95) ylabel(-2(1)2) yscale(r(-2,2)) name(fup10, replace)


* ## Zillow Housing Values Index Regressions

* # 2-unit cross-section

* Control > 2500

import delimited "data_zhvi_2023.csv", clear

drop if large == 1
drop if pop_19 < 2500

reg zhvi medium

predict r, resid
swilk r

estat hettest
estat imtest, white

* 

import delimited "data_zhvi_2023.csv", clear

drop if large == 1
drop if pop_19 < 2500

reg zhvi medium pop_growth three_unit_bldgs five_unit_bldgs two_unit_bldgs_20 three_unit_bldgs_20 five_unit_bldgs_20 under_eighteen_2022 black_2022 hisp_2022 race_other_2022 median_income_2022 bach_edu_2022 pct_renter_2022, r

vif

predict r, resid
swilk r

* Control > 5000

import delimited "data_zhvi_2023.csv", clear

drop if large == 1
drop if pop_19 < 5000

reg zhvi medium

predict r, resid
swilk r

estat hettest
estat imtest, white

* 

import delimited "data_zhvi_2023.csv", clear

drop if large == 1
drop if pop_19 < 5000

reg zhvi medium pop_growth three_unit_bldgs five_unit_bldgs two_unit_bldgs_20 three_unit_bldgs_20 five_unit_bldgs_20 under_eighteen_2022 black_2022 hisp_2022 race_other_2022 median_income_2022 bach_edu_2022 pct_renter_2022, r

vif

predict r, resid
swilk r

* Control > 7500

import delimited "data_zhvi_2023.csv", clear

drop if large == 1
drop if pop_19 < 7500

reg zhvi medium

predict r, resid
swilk r

estat hettest
estat imtest, white

* 

import delimited "data_zhvi_2023.csv", clear

drop if large == 1
drop if pop_19 < 7500

reg zhvi medium pop_growth three_unit_bldgs five_unit_bldgs two_unit_bldgs_20 three_unit_bldgs_20 five_unit_bldgs_20 under_eighteen_2022 black_2022 hisp_2022 race_other_2022 median_income_2022 pct_renter_2022

vif

predict r, resid
swilk r

estat hettest
estat imtest, white

* # ZHVI event study

* Control > 2500

import delimited "data_zhvi.csv", clear 

drop if large == 1
drop if pop_19 < 2500

gen period_p = period + 53
egen cityn = group(place)
xtset cityn period_p 

xtreg zhvi o53.period_p#o.medium i.period_p, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.medium) omit base rename(*.period_p#*.medium="") xlabel(1 "Jan. 2017" 7 "Jun. 2017" 13 "Jan. 2018" 19 "Jun. 2018" 25 "Jan. 2019" 31 "Jun. 2019" 37 "Jan. 2020" 43 "Jun. 2020" 49 "Jan. 2021" 55 "Jun. 2021" 61 "Jan. 2022" 67 "Jun 2022" 73 "Jan. 2023" 79 "Jun. 2023",angle(-45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("ZHVI") xtitle("Period (Month/Year)") level(95) ylabel(-30000 "-30,000" -15000 "-15,000" 0 "0" 15000 "20,000" 30000 "30,000") yscale(r(-30000,30000)) name(zhvi2500, replace)

* Control > 5000

import delimited "data_zhvi.csv", clear 

drop if large == 1
drop if pop_19 < 5000

gen period_p = period + 53
egen cityn = group(place)
xtset cityn period_p 

xtreg zhvi o53.period_p#o.medium i.period_p, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.medium) omit base rename(*.period_p#*.medium="") xlabel(1 "Jan. 2017" 7 "Jun. 2017" 13 "Jan. 2018" 19 "Jun. 2018" 25 "Jan. 2019" 31 "Jun. 2019" 37 "Jan. 2020" 43 "Jun. 2020" 49 "Jan. 2021" 55 "Jun. 2021" 61 "Jan. 2022" 67 "Jun 2022" 73 "Jan. 2023" 79 "Jun. 2023",angle(-45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("ZHVI") xtitle("Period (Month/Year)") level(95) ylabel(-30000 "-30,000" -15000 "-15,000" 0 "0" 15000 "20,000" 30000 "30,000") yscale(r(-30000,30000)) name(zhvi5000, replace)

* Control > 7500

import delimited "data_zhvi.csv", clear 

drop if large == 1
drop if pop_19 < 7500

gen period_p = period + 53
egen cityn = group(place)
xtset cityn period_p 

xtreg zhvi o53.period_p#o.medium i.period_p, fe vce(cluster place) 

coefplot, vertical keep(*.period_p#*.medium) omit base rename(*.period_p#*.medium="") xlabel(1 "Jan. 2017" 7 "Jun. 2017" 13 "Jan. 2018" 19 "Jun. 2018" 25 "Jan. 2019" 31 "Jun. 2019" 37 "Jan. 2020" 43 "Jun. 2020" 49 "Jan. 2021" 55 "Jun. 2021" 61 "Jan. 2022" 67 "Jun 2022" 73 "Jan. 2023" 79 "Jun. 2023",angle(-45)) nolabels color(black) plotregion(color(white)) graphregion(color(white)) ytitle("ZHVI") xtitle("Period (Month/Year)") level(95) ylabel(-30000 "-30,000" -15000 "-15,000" 0 "0" 15000 "20,000" 30000 "30,000") yscale(r(-30000,30000)) name(zhvi7500, replace)
