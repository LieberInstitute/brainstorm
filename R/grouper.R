#' Find groups of correlating samples
#'
#' Create groups of sample from a cor table with correlation >= cutoff
#'
#' @param corTable Table of paiwise correlation between samples
#' @param cutoff corrlation threshold for samples to be grouped together
#' @param s1 Name of first column that contains sample names
#' @param s2 Name of second column that contains sample names
#'
#' @return List of groups found in the cor table
#' @export
#'
#' @examples
#' cor_test <- make_corLong(snps1 = test_snps, BrainTable1 = test_BrTable, ID_col1 = "Sample")
#' g <- grouper(cor_test)
#'
#' snpsCalled_filter <- filter_called(snpsCalled_VCF)
#' snpsRNA <- make_snpsRNA(snpsGeno_VCF, snpsCalled_filter)
#' pd_simple <- pd_example[,1:4]
#' corLong_rna <- make_corLong(snpsRNA$snpsCalled, BrainTable1 = pd_simple, ID_col1 = "SAMPLE_ID")
#' groups_rna <- grouper(corLong_rna)
#' @importFrom purrr map
grouper <- function(corTable, cutoff = 0.59, s1 = "row_sample", s2 = "col_sample") {
    .check_cols(table = corTable, check_colnames = c(s1, s2), table_name = "corTable")

    samples <- unique(c(corTable[[s1]], corTable[[s2]]))
    message("grouping ",length(samples), " samples...\n")

    groups <- purrr::map(samples, ~ .grouper(.x, corTable, cutoff, s1, s2))
    groups <- unique(groups)
    return(groups)
}

.grouper <- function(samples, corTable, cutoff, s1, s2) {
    # RCMD check fix
    cor <- NULL

    ct <- subset(corTable, cor >= cutoff & (corTable[[s1]] %in% samples | corTable[[s2]] %in% samples))
    new_samples <- unique(c(ct[[s1]], ct[[s2]]))

    if (!all(new_samples %in% samples)) {
        return(.grouper(new_samples, corTable, cutoff, s1, s2))
    } else {
        one_sample <- length(samples) == 1
        ct2 <- ct
        if(one_sample){
            ct2 <- subset(corTable, corTable[[s1]] == samples | corTable[[s2]] == samples)
        }
        ## make record table
        record_row <- ct2[, grepl("row_", colnames(ct2))]
        record_col <- ct2[, grepl("col_", colnames(ct2))]

        colnames(record_row) <- gsub("row_", "", colnames(record_row))
        colnames(record_col) <- gsub("col_", "", colnames(record_col))

        common_colnames <- intersect(colnames(record_row), colnames(record_col))

        record <- rbind(record_row[,common_colnames], record_col[,common_colnames])

        if(one_sample){
            record <- subset(record, sample == samples)
        }
        rownames(record) <- NULL
        record <- unique(record)

        bn <- unique(record[["BrNum"]])
        bn <- bn[order(bn)]
        samples <- samples[order(samples)]
        r <- list(length(samples), length(bn), samples, bn, record, ct)
        names(r) <- c("n", "nBrNum", "samples", "BrNum", "records", "cor")
        return(r)
    }
}
