# hospitals
---
title: "Read me"
---

Overall code to show an example to estimate models proposed in: Pennoni, F. Vittadini E. (2013). Two competing models for ordinal longitudinal data with time-varying latent effects: an application to evaluate hospital efficiency. Quaderni di Statistica, 15, 53-68.

The files are the following:

## Data 

- datalong1.Rdata: contains artificial data as an example of the data used for the analysis:
-- id: unit identifier
-- time: 8: 2008, 9: 2009, 10: 2010, 11:2011
-- Y: measure of efficiency defined according to the quartile of the response variable given  by the ratio of the total revenues and discharges of the hospitals whose categories in each year are: 1: low, 2: medium, 3: high, 4: very high
-- nbeds: number of total beds in the ward
-- hphys: hours of activity of physicians
-- hnurses: hours of activity of nurses 
-- hothers: hours of activity of other employees
-- hsr:  hours of activity of surgery rooms


## Code 

- Code_competitive_models.R: to estimate the proposed Latent  Markov model with covariates in the manifest model and latent mixture model with a certain number of support points for the autoregressive process.
