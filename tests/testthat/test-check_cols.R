test_that("Cols present", {
    expect_null(.check_cols(table = brainstorm::test_snps, check_colnames = c("A")))
    expect_null(.check_cols(table = brainstorm::test_snps, check_colnames = c("A", "B")))
})

test_that("Cols Missing", {
    expect_error(.check_cols(table = brainstorm::test_snps, check_colnames = c("X", )))
    expect_error(.check_cols(table = brainstorm::test_snps, check_colnames = c("X", "Y")))
})
