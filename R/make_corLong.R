#' Create Long Correlation Tables
#'
#' Compute pairwise correlations between one or two snp arrays, then convert to long format
#'
#' @param snps1 Table of snps, RNA or DNA,
#' @param snps2 Table of snps, RNA or DNA, if NA snps1 will be compared to its self
#' @param BrainTable1 Table containing ID info for samples in snps1
#' @param BrainTable2 Table containing ID info for samples in snps2
#' @param ID_col1 Name of column containing Samples names in BrainTable1
#' @param ID_col2 Name of column containing Samples names in BrainTable2
#'
#' @return Data frame with correlation between samples in snps1 (or between snps1 and snps2)
#' and ID info from BrainTables (at least BrNums for samples)
#' @export
#'
#' @examples
#' x <- make_corLong(snps1 = test_snps, BrainTable1 = test_BrTable, BrainTable2 = test_BrTable, ID_col1 = "Sample", ID_col2 = "Sample")
#'
#' snpsGeno <- make_snpsGeno(genotyped)
#' jaffelab::corner(snpsGeno)
#' brain_sentrix <- read.csv("Data/brain_sentrix.csv")
#' corLongtest <- make_corLong(snpsGeno, BrainTable1 = brain_sentrix)
#'
#' corLongtest <- make_corlong
#' @importFrom dplyr left_join
#' @importFrom stats cor
make_corLong <- function(snps1, snps2 = snps1, BrainTable1, BrainTable2 = BrainTable1, ID_col1 = "ID", ID_col2 = ID_col1) {
    # RCMD check fix
    cor <- NULL

    snpCor <- stats::cor(snps1, snps2, use = "pairwise.comp")
    rownames(snpCor) <- colnames(snps1)
    colnames(snpCor) <- colnames(snps2)
    snpCor[lower.tri(snpCor, diag = TRUE)] <- NA
    corLong <- data.frame(cor = signif(as.numeric(snpCor), 3))
    corLong$row_sample <- rep(rownames(snpCor), times = ncol(snpCor))
    corLong$col_sample <- rep(colnames(snpCor), each = nrow(snpCor))
    corLong <- corLong[!is.na(corLong$cor), ]
    BrainTable3 <- BrainTable2
    colnames(BrainTable1) <- paste0("row_", colnames(BrainTable1))
    colnames(BrainTable2) <- paste0("col_", colnames(BrainTable3))
    corLong <- dplyr::left_join(corLong, BrainTable1, by = c("row_sample" = paste0("row_", ID_col1)))
    corLong <- dplyr::left_join(corLong, BrainTable2, by = c("col_sample" = paste0("col_", ID_col2)))
    return(corLong)
}
## test permissions
