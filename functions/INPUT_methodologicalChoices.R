###############################################################################
#Cost-effectiveness of different typhoid vaccine delivery strategies in all GAVI-eligible countries
# 
# Methodological choices 
#
# Created: Joke Bilcke Feb 2017
# Updated: Jiye Kwon 2023 
###############################################################################

##################################
# COUNTRIES 
##################################
# all 73 GAVI-eligible countries in 2017

countries=read.table('countries and who regions.csv',sep=',',header=T)
##remove Moldova and Ukraine because not output from dynamic model for these countries
#indexcountrieswithoutinc=which(countries$country%in%c('Moldova','Ukraine')) 
#countries=countries[-indexcountrieswithoutinc,]
countries$country=as.character(countries$country)
countries$iso=as.character(countries$iso)
countries=countries[order(countries$country),]
countrynames=gavicountrynames=countries$country 
countryiso=countries$iso
names(countryiso)=countrynames
regionnames=levels(factor(countries$whoregion)) # edited
gdpbycountry=countries$GDP2015
names(gdpbycountry)=countrynames #vector, for each country GDP per capita
popsize=countries$totpop #I added this in the Excel file, from the file 'Final_pop_used_byISO3_gavi73.csv' (Marina sent 4 oct 2018), but needed to reorder Sri Lanka, South Sudan and Republic of Sudan; and COD and COG to have same order of countries as in who regions file
names(popsize)=countrynames
#load(file='gdpbycountry.R') #vector, for each country GDP per capita

#List of Gavi 54 countries
countriesGavi54=read.table('countries and who regions_Gavi54.csv',sep=',',header=T)
countrynamesGavi54=as.character(countriesGavi54$country) 

##################################
# METHODOLOGICAL CHOICES
##################################

#Drummond et al 2005 book 3rd ed distinguish between 4 types of resources consumed (Fig 3.1 p.32): health sector, other sector, patient/family, productivity losses
#p.55:'If in doubt about the perspective, the analyst should always adopt the societal point of view,
#which is the broadest one and is always relevant.'and p.57: 'It is not worth investing a great deal of time and effort considering costs that, 
#because they are small, are unlikely to make any difference to the study results. However, some justification should be given for the elimination of such costs.'
### Perspective
#hcp/soc --> for now only use health provider perspective

### Time horizon
nyears=10 #we report info on 30 years in the future --> additional array dimension (i.e. work year by year)
#different time horizons will be considered by summing over different time intervals 

### Discount rate
#for now keep fix and same for costs and DALYs, according to B&M Gates reference case
discountratecost=discountrateeffect=0.03 

### Number of age groups (dynamic model)
#nage=6

### Vaccine delivery strategies
#'Base': no vaccination
#'Routine': routine vaccination at 9 months of age cov 80%
#'RoutineC05': routine vaccination at 9 months of age cov 80% + catch-up campaign cov 70% for children up to 5 yrs of age (no good reason)
#'RoutineC15': routine vaccination at 9 months of age cov 80% + catch-up campaign cov 70% for children up to 15 yrs of age (standard age cutoff for campaigns)
vacstratnames=c('none','routine','routine+camp5','routine+camp15')
vaccomparisonnames=c('routine vs none', 'routineC5 vs none','routineC15 vs none')

### Cost year
costyear=2016 #year for which costs are presented
### Number of samples from uncertainty distribution
nsamples=2000
### Vaccine procurement cost per dose
vaxprice2016usd=1.5

### Uncertainty
factorindcountrynation=1 #extrapolate data from an individual 
factorindcountryregion=2 #use estimate from a single region as estimate for the whole country 
factorcountrynoinfo=2 #use estimate from another country
factorproxy=2 #using a proxy
factorWHO=1 #just use se from prediction model
factorsinglecountry=2 #only one study available for the country

### Scenario's
#SCENARIO vaccine delivery cost routine and campaign
excludegavicontr=1 #1=yes=default, 0=no
#SCENARIO data source on which vaccine delivery cost for campaigns is based:
indvacdelcamp=1 #1=vacdelcamp based on data (Ghandi & Lydon)=default, 0=delivery cost campaign is assumed same as delivery cost routine
#SCENARIO assume vacdelrout same as vacdelcamp
indvacdelrout=0 #default is 0; scenario is 1
#SCENARIO decreasing incidence over time without vaccination
#!!CAN ONLY BE USED FOR A 10 YEAR TIME HORIZON!!
decreasingincidence=0 #(1=yes, 0=no), default=0
#SCENARIO deterministic sensitivity analysis
DSA=vector()
