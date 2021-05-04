#' Title
#'
#' @param genotype object from variantAnnotation::readVcf
#'
#' @return
#' @export
#'
#' @examples
#' genotyped <- readVcf("Data/LIBD_Brain_merged_topmed_RNASeq_annotated_variants_043020.vcf", "hg38")
#' snpsGeno <- make_snpsGeno(genotyped)
#' jaffelab::corner(snpsGeno)
#' head(colnames(snpsGeno))
make_snpsGeno <- function(genotyped) {
    snpsGeno <- VariantAnnotation::geno(genotyped)$GT
    snpsGeno[snpsGeno == "./."] <- NA
    snpsGeno[snpsGeno == "0|0"] <- 0
    snpsGeno[snpsGeno == "0|1"] <- 1
    snpsGeno[snpsGeno == "1|0"] <- 1
    snpsGeno[snpsGeno == "1|1"] <- 2
    class(snpsGeno) <- "integer"
    return(snpsGeno)
}
