# Generate example dataset
# author: Daniela Palleschi

# Required packages ----

# uncomment the following two lines to install packages if needed
# install.packages("tidyverse")
# install.packages("here")

# load packages
library(tidyverse)
library(here)

# Generate data ----

set.seed(2024)

df_example <-
  tibble(
  id = rep(01:06, each = 4),
  condition = rep(c("A", "B"), times = 12),
  rating = floor(runif(24, min=1, max=8))
)

# Save dataframe in data/ ----
write_csv(df_example, here("data", "example_data.csv"))