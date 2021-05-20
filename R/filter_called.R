#' Filter the Called snp array
#'
#'
#' @param called CollapsedVCF containing filtered snp info for rna data
#' @param DP_min TODO
#' @param DP_max TODO
#' @param ref_call TODO
#' @param alt_call TODO
#' @param overlaps TODO
#' @param min_VDB TODO
#'
#' @return Filtered snp array
#' @export
#'
#' @examples
#' dim(called)
#' called_filter <- filter_called(called)
#' dim(called_filter)
#' @import VariantAnnotation
#' @importFrom Biostrings nchar
#' @importFrom IRanges elementNROWS
#' @importFrom GenomicRanges countOverlaps
filter_called <- function(called, DP_min = 5, DP_max = 80, ref_call = 1, alt_call = 1, overlaps = 1, min_VDB = .1) {
    called <- called[VariantAnnotation::info(called)$DP > DP_min * ncol(called) &
        VariantAnnotation::info(called)$DP < DP_max * ncol(called) &
        Biostrings::nchar(VariantAnnotation::ref(called)) == ref_call &
        IRanges::elementNROWS(VariantAnnotation::alt(called)) == alt_call &
        GenomicRanges::countOverlaps(called, type = "equal") == overlaps &
        VariantAnnotation::info(called)$VDB > min_VDB, ]
    return(called)
}
