## code to prepare `test_BrTable` dataset goes here

test_BrTable <- data.frame(Sample = c("A","B","C","D"),
                           BrNum = rep(c("Br01","Br02"), each = 2))

usethis::use_data(test_BrTable, overwrite = TRUE)
