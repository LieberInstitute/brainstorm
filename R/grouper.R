#' Title
#'
#' @param samples
#' @param corTable
#' @param cutoff
#' @param s1
#' @param s2
#' @param records
#' @param id
#'
#' @return
#' @export
#'
#' @examples
grouper <- function(samples, corTable, cutoff = 0.59,  s1 = "rowSample", s2 = "colSample", records, id){
  ct <- subset(corTable, cor >= cutoff & (corTable[[s1]] %in% samples | corTable[[s2]] %in% samples))
  new_samples <- unique(c(ct[[s1]] , ct[[s2]]))
  if(!all(new_samples %in% samples)){
    return(grouper(new_samples, corTable, cutoff, s1, s2, records, id))
  } else{
    record <- subset(records, records[[id]] %in% samples)
    bn <- unique(record[["BrNum"]])
    bn <- bn[order(bn)]
    samples <- samples[order(samples)]
    r <- list(length(samples), length(bn),samples, bn,record,ct)
    names(r) <- c("n", "nBrNum","samples","BrNum","records","cor")
    return(r)
  }
}
