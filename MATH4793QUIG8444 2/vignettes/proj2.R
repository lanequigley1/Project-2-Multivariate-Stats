## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
ddt=MATH4793QUIG8444::ddt
MATH4793QUIG8444::dataSummary(ddt)

## ------------------------------------------------------------------------
ddt=MATH4793QUIG8444::ddt
MATH4793QUIG8444::myScatterPairsE(ddt,2,3,.95)

