library(tidyr)
library(dplyr)

dp2.data <- read.csv("../data/Decision_Making_First_72hours_2016_DecisionPoint2_Payam.csv", stringsAsFactors = F)

str(dp2.data)
names(dp2.data)
dp2.data.clean <- dp2.data %>%
    #select(-starts_with("CP")) %>%
    #select(-starts_with("X")) %>%
    select(-one_of(names(dp2.data)[c(413:415, 417, 419:420)])) %>% # All X's, but X_index and X_parent_index
    select(-starts_with("meta"))

names(dp2.data.clean)
# str(dp2.data.clean)
# str(dp2.data.clean[,90:180])
# str(dp2.data.clean[,180:270])
# str(dp2.data.clean[,270:360])
# str(dp2.data.clean[,360:length(names(dp2.data.clean))])

# The key column will be called "Need"
# The columns not having values are listed to be skipped while collapsing
dp2.data.clean.long <- gather(dp2.data.clean, Need, Value,
                              -Org_Name, -Org_Cat_Description, -Catorg_ID,
                              -Typorg_ID, -Org_ID, -A_Infotype,
                              -X_index, -X_parent_index,
                              -CC1_info_needs,
                              -CC4_CSS_GC,-CC4_CSS_PP,-CC4_CSS_I,-CC4_CSS_LL,-CC4_CSS_IC,
                              -CC4_HN_PC, -CC4_HN_IC, 
                              -CC4_HA_ACCESS_RELIEF, -CC4_HA_ACCESS_AFFECTED, -CC4_HA_SL, -CC4_HA_IC, 
                              -CC4_CR_PC, -CC4_CR_IC,
                              
                              -CP1_info_products, -CP1_info_product_type,
                              -CP4_CSS_GEO, -CP4_CSS_PP, -CP4_CSS_I, -CP4_CSS_LL, -CP4_CSS_IC, 
                              -CP4_HN_PC, -CP4_HN_IC, 
                              -CP4_HA_ACCESS_RELIEF, -CP4_HA_ACCESS_AFFECTED, -CP4_HA_SL, -CP4_HA_IC,
                              -CP4_CR_PC, -CP4_CR_IC, 
                              
                              -CB1_INFO_NEEDS,
                              -CB4_CSS_GEO, -CB4_CSS_PP, -CB4_CSS_I, -CB4_CSS_LL, -CB4_CSS_IC, 
                              -CB4_HN_PC, -CB4_HN_IC, 
                              -CB4_HA_ACCESS_RELIEF, -CB4_HA_ACCESS_AFFECTED, -CB4_HA_SL, -CB4_HA_IC,
                              -CB4_CR_PC, -CB4_CR_IC,
                              
                              -FB1_INFO_PRODUCTS, -FB1_INFO_PRODUCT_TYPE,
                              -FB4_CSS_GEO, -FB4_CSS_PP, -FB4_CSS_I,  -FB4_CSS_LL, -FB4_CSS_IC,
                              -FB4_HN_PC, -FB4_HN_IC
                              -FB4_HA_ACCESS_RELIEF, -FB4_HA_ACCESS_AFFECTED, -FB4_HA_SL, -FB4_HA_IC,
                              -FB4_CR_PC, -FB4_CR_IC)

# drop unneeded columns
dp2.data.clean.long <- dp2.data.clean.long %>%
    select(-starts_with("CC")) %>%
    select(-starts_with("CP")) %>%
    select(-starts_with("CB")) %>%
    select(-starts_with("FB"))
                                  
write.csv(dp2.data.clean.long, "../data/Decision_Making_First_72hours_2016_DecisionPoint2_Payam_Tidy.csv", row.names = F, na = "")
