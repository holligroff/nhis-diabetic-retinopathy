# =============================================================================
# Trends in Vision-Threatening Diabetic Retinopathy Among US Adults
# Data Source: MEPS Medical Conditions Files HC-190, HC-214, HC-241
# Survey Years: 2016, 2019, 2022
# Author: Holli A. Groff, OD, MPH
# =============================================================================

library(dplyr)
library(ggplot2)

# ICD-10 codes: severe NPDR, PDR, traction detachment, DME
dr_codes <- c(
  "E11331","E11332","E11333","E11339",  # Severe NPDR
  "E11341","E11342","E11343","E11349",  # PDR
  "E11351","E11352","E11353","E11359",  # PDR with traction detachment
  "E113211","E113212","E113213",        # Mild NPDR + DME
  "E113311","E113312","E113313",        # Severe NPDR + DME
  "E113411","E113412","E113413"         # PDR + DME
)

# Load each year
source("h190.txt"); h190 <- h190 %>% mutate(year = 2016)
source("h214.txt"); h214 <- h214 %>% mutate(year = 2019)
source("h241.txt"); h241 <- h241 %>% mutate(year = 2022)

# Check column names
names(h190)