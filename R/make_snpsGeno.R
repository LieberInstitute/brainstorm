#' Make the snp array for genotype data
#'
#' @param genotyped object from variantAnnotation::readVcf
#'
#' @return snp array encoded as integers
#' @export
#'
#' @examples
#' snpsGeno <- make_snpsGeno(snpsGeno_VCF)
#' snpsGeno[1:5, 1:5]
#' @importFrom VariantAnnotation geno
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
