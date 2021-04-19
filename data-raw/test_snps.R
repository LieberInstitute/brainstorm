## code to prepare `test_snps` dataset goes here
test_snps <- matrix(c(rep(c(1,1,0,0), 2),rep(c(0,0,1,1), 2)), nrow = 4)
colnames(test_snps) <- c("A","B","C","D")

usethis::use_data(test_snps, overwrite = TRUE)
