# Visualise example dataset
# author: Daniela Palleschi

# Required packages ----

## uncomment the following two lines to install packages if needed
# install.packages("tidyverse")
# install.packages("here")
# install.packages("scales")

## load packages
library(tidyverse)
library(here)
library(scales)

# Read in data with setwd() ----

## working directory (get/setwd()) ----
getwd()
setwd("/Users/danielapalleschi/Documents/R/rproject-template")
getwd()

## load in the data ----

df_rating <- read_csv("data/example_data.csv")

# this likely caused problems if you're not on my machine

# Read in data with 'here' ----
df_rating <- read_csv(here("data", "example_data.csv"))

# this likely didn't cause problems, assuming you're working in an R Project

# Visualise data ----

fig_rating <-
  df_rating |>
  # make rating a factor
  mutate(rating = factor(rating)) |> 
  ggplot() +
  aes(x = condition, fill = rating) +
  geom_bar() +
  # get whole integers along y-axis
  scale_y_continuous(breaks = breaks_pretty()) +
  # change theme
  theme_bw() +
  labs(title = "Frequency of ratings (1-7) per condition",
       x = "Condition",
       y = "Frequency")

# Save figure ----

## as R data
saveRDS(fig_rating, here("figures", "fig_rating_barplot.Rdata"))

## as PNG
ggsave(fig_rating, filename = here("figures", "fig_rating_barplot.png"))
