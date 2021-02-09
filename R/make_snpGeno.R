#' Title
#'
#' @param vcfilename
#' @param brain_sentrix
#'
#' @return
#' @export
#'
#' @examples
#' test<-make_snpGeno("Data/LIBD_Brain_merged_topmed_RNASeq_annotated_variants_043020.vcf","hg38")
make_snpGeno<-function(vcfPath,build){
    genotyped = VariantAnnotation::readVcf(vcfPath,genome=build)
    snpsGeno = VariantAnnotation::geno(genotyped)$GT
    snpsGeno[snpsGeno == "./."] = NA
    snpsGeno[snpsGeno == "0|0"] = 0
    snpsGeno[snpsGeno == "0|1"] = 1
    snpsGeno[snpsGeno == "1|0"] = 1
    snpsGeno[snpsGeno == "1|1"] = 2
    class(snpsGeno) = "integer"
    return(snpsGeno)
    message("computing corellation ",Sys.time())
    snpCor = cor(snpsGeno,use="pairwise.comp")
    snpCor[lower.tri(snpCor, diag=TRUE)] = NA
    corLong = data.frame(cor = signif(as.numeric(snpCor),3))
    corLong$rowSample = rep(colnames(snpsGeno), times = ncol(snpsGeno))
    corLong$colSample = rep(colnames(snpsGeno), each = ncol(snpsGeno))
    corLong = corLong[!is.na(corLong$cor),]
    return(corLong)

}
