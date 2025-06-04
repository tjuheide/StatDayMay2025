
library(ggplot2)
library(patchwork)
library(data.table)
library(dplyr)
library(pammtools)
library(scales)

survival <- fread("//uni.au.dk/dfs/HE_KEA-DCESAS02/S/Stat day May 2025/risk_curves/data/riskdata.csv") |>
  mutate(x = factor(
    x,
    levels = c(2,1),
    labels = c("Control", "Intervention")
  )) |>
  filter(analysis == "Survival")

# data for risk table
atrisk_survival <- survival |>
  filter(is.na(natrisk) == F) |>
  select(x, time, natrisk)

# subsetting to the risk analysis
risk <- fread("//uni.au.dk/dfs/HE_KEA-DCESAS02/S/Stat day May 2025/risk_curves/data/riskdata.csv") |>
  mutate(x = factor(
    x,
    levels = c(2,1),
    labels = c("Control", "Intervention")
  )) |>
  filter(analysis != "Survival")

# data for risk table
atrisk_risk <- risk |>
  filter(is.na(natrisk) == F) |>
  select(x, time, natrisk, analysis)

bsize <- 15

mypal <- c("#E69F00", "#56B4E9")