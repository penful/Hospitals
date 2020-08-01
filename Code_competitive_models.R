#### EXAMPLE ####
# PROVIDED BY FULVIA PENNONI #
# Code to show the model proposed in the article: ####
# Pennoni, F., Vittadini, G. (2013). 
# Two competing models for ordinal longitudinal data with time-varying latent effects: 
# an application to evaluate hospital efficiency. 
# Quaderni di Statistica, 15, 53-68. 

# Artificial data to show the code employed in the paper.
# They refer to a four year period (2008-2011 in the article).
# Lables:
# id: unit identifier
# time: 8: 2008, 9: 2009, 10: 2010, 11:2011
# Y: measure of efficiency defined according to the 
# quartiles of the response variable given 
# by the ratio of the total revenues and discharges of the hospitals  
# whose categories in each year are: 1: low, 2: medium, 3: high, 4: very high
# nbeds: number of total beds in the ward
# hphys: hours of activity of physicians
# hnurses: hours of activity of nurses 
# hothers: hours of activity of other employees
# hsr:  hours of activity of surgery rooms


load("datalong1.Rdata")

require(LMest)

# Structure and objects for the estimation functions

dt <- lmestData(data = datalong1, 
                id = "id", 
                time="time",
                responsesFormula = Y ~ NULL)

#### Fit latent Markov model ####

outlm <- lmest(responsesFormula = Y ~ -1 +
             nbeds + hphys + hnurses + hothers + hsr,
             index = c("id","time"),
             data = dt$data,
             k = 4,
             modManifest = "LM",
             tol = 1e-1, 
             out_se = TRUE)
summary(outlm)
outlm$be/outlm$sebe
# to select the number of states see also function lmestSearch

##### Fit Mixture latent autoregressive model ####

outar <- lmest(responsesFormula = Y ~ -1 +
              nbeds + hphys + hnurses + hothers + hsr,
              index = c("id","time"),
              data = dt$data,
              k = 1,
              q = 81,
              modManifest = "FM",
              tol = 1e-1, out_se = TRUE)

summary(outar)
outar$be/outar$sebe