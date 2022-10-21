#delimit;    /* make it so the semicolon signals end of each line 
                    because we can't see where the return is  */     
set more 1;  /* makes it so stata does not stop at each screen of output */
drop _all ;  /* clear all the variables in memory, if any */
capture log close; /* close any open log files */

cd "C:\Users\Muyan Xie\Documents";

use test.dta;

sum;

encode region, gen(region_1);
encode public_mee*, gen(public_1);
encode scheme_*, gen(scheme_1);
encode permit, gen(permit_1);
encode management, gen(management_1);
encode quality*, gen(quality_group_1);
encode quanti*, gen(quantity_group_1);
encode source_class, gen(source_class_1);
encode waterpoint_type, gen(waterpoint_type_1);

drop region public_mee* scheme_m* permit management quality_group quantity_group source_class waterpoint_type;

replace public_1 = 2 if public_1 == .;
replace scheme_1 = 2 if scheme_1 == .;
replace permit_1 = 2 if permit_1 == .;
sum;

save processed_test;
#delimit cr