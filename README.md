# Typhoid CEA study
## Cost-effectiveness of routine and campaign use of typhoid Vi-conjugate vaccine in Gavi-eligible countries: a modelling study    
Manuscript: https://www.thelancet.com/journals/laninf/article/PIIS1473-3099(18)30804-1/fulltext 

#### List of all datafiles that need to be read to run the code:
* methodological choices
  * countries and who regions.csv
  * countries and who regions_Gavi54.csv
* rawdata_dynamicoutput
  * typh_Joke_Dec15_unc.Rdata
  * countrycodesMarina6june.csv
  * World Bank Life Expectancy at Birth.csv
* inputdata_dynamicoutput
  * Folder 'dynamicoutputunc_constantInc'
    * 'casesadj.RData'
    * 'nrdosesroutineadj.RData'
    * 'nrdosescampaignadj.RData'
    * 'dynmodpar.RData'
    * 'meanagecases.RData'
    * 'baselinecases.RData'

  * Folder 'dynamicoutputunc_decreasingInc' (for scenario decreasing incidence over time due to WASH improvement)
    * 'casesadj.RData'
    * 'nrdosesroutineadj.RData'
    * 'nrdosescampaignadj.RData'
    * 'dynmodpar.RData'
    * 'meanagecases.RData'
    * 'baselinecases.RData'

* rawdata_healthcareuse
  * psi.csv 
* input_costsgeneral
  * CPI us dollars.csv
  * WHO-CHOICE_2010_confidential_exchange rates_ID_NCU.txt
  * WHO-CHOICE_2010_confidential_exchange rates_NCU_USD.txt

* rawdata_treatmentcosts
  * WHO_CHOICE_2010_confidential_beddayPRIM.csv
  * WHO_CHOICE_2010_confidential_outpatientHCnobeds.csv

* rawdata_vaccinerelatedcosts
  * gavi73contr.csv
  * vaccine routine delivery cost data.csv
  * Table 1 Ghandi and Lydon.csv
  * 'gavi73phaseyear1'
 
* rawdata_dalys
  * World Bank Life Expectancy at Birth.csv
  * Data.txt
 

----------
**Pitzer Lab** | YSPH Public Health Modeling Unit | virginia.pitzer@yale.edu
