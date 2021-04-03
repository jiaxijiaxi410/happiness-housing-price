import excel "/Users/jiaxiwang/Downloads/data 731 clean.xlsx", sheet("Sheet2") firstrow

sum _all

encode State, gen(state)
encode City, gen(city)

drop Column2
drop Column3
drop Column4
drop City
drop State

gen price_log=log(medianlistingprice)
gen pop_log=log(Population)
gen inc_log=log(Dollars)
gen vcrm_log=log(Violentcrime)
gen pcrm_log=log(Propertycrime)

drop price2
gen price2=price_log^2

rename TotalScore happiness

reg happiness price_log pop_log inc_log unemploymentrate vcrm_log pcrm_log

findit esttab

eststo clear 

eststo: reg happiness price_log pop_log inc_log unemploymentrate vcrm_log pcrm_log

eststo: reg happiness price_log pop_log inc_log unemploymentrate vcrm_log pcrm_log city state

eststo: reg happiness price_log price2 pop_log inc_log unemploymentrate vcrm_log pcrm_log

esttab

cd "/Users/jiaxiwang/Downloads/"

esttab using d.rtf
