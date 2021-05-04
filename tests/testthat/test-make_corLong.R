test_that("ncol corLong(test_snps)", {
    cor_test <- make_corLong(snps1 = test_snps, BrainTable1 = test_BrTable, ID_col1 = "Sample")
    expect_equal(ncol(cor_test), 5)
})
