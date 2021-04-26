test_that("Number of groups in cor_test", {
  cor_test <- make_corLong(snps1 = test_snps, BrainTable1 = test_BrTable, ID_col1 = "Sample")
  g <- grouper(cor_test)
  expect_equal(length(g), 2)
})
