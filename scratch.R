
# make a tible with replicate

library(janitor)
library(tidyverse)

# works
#x <- tibble(replication = 1:5,
#  which_bowl = as.character(map(1:5, ~ sample(c("Bowl 1", "Bowl 2"), 1))))

x <- tibble(replication = 1:10000,
  which_bowl = sample(c("Bowl 1", "Bowl 2"), 1, size = 10000)) %>%
  mutate(cookie = ifelse(which_bowl == "Bowl 1", 
                         sample(c("vanilla", "chocolate"), size = 10000, replace = TRUE, prob = c(3/4, 1/4)),
                         sample(c("vanilla", "chocolate"), size = 10000, replace = TRUE, prob = c(3/4, 1/4))))


# probability of picking from bowl 1 given that you picked vanilla

x %>% tabyl(which_bowl, cookie) %>% 
  adorn_percentages(denominator = "col") %>% 
  adorn_pct_formatting()

 

# Downloading using download.file()
library(fs)
url <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vSaerGnn1tDQfgiyJRl7jnn1Au7Ev6Qt7BwMpl53ZgzAyMnANQfog9y4es4ZExlX5tjEgl0mPIyTGcP/pub?gid=480043959&single=true&output=csv"
download.file(url, destfile = "trains.csv")

trains <- read_csv("trains.csv")

# avergae effect of being exposed to spanish speakers

trains %>% group_by(treatment) %>% 
  summarise(avg = mean(attitude))



