## code to prepare `brain_sentrix` dataset goes here

brain_sentrix <- read.csv(here("data-raw","brain_sentrix_speaqeasy.csv"))

dim(brain_sentrix)
length(unique(brain_sentrix$BrNum))
table(table(brain_sentrix$BrNum))

usethis::use_data(brain_sentrix, overwrite = TRUE)
