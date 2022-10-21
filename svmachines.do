#delimit;    /* make it so the semicolon signals end of each line 
                    because we can't see where the return is  */     
set more 1;  /* makes it so stata does not stop at each screen of output */
drop _all ;  /* clear all the variables in memory, if any */
capture log close; /* close any open log files */

cd "C:\Users\Muyan Xie\Documents";
use merged_dataset;
sum;

local split = floor(_N*49841/64691);
local train = "1/`=`split'-1'";
local test = "`split'/`=_N'";

svmachines status_group_1 amount_tsh gps_height longitude latitude num_private population construction_year region_1 public_1 scheme_1 permit_1 management_1 quality_group_1 quantity_group_1 source_class_1 waterpoint_type_1 in `train', kernel(rbf) gamma(0.5);

predict P in `test';

save results_water_pump.dta, replace;

#delimit cr