#' Title
#'
#' @param snpsGeno
#' @param brainsentrix
#'
#' @return
#' @export
#'
#' @examples
#'corLongtest<-make_corLong(test,SampleDataPath="Data/brain_sentrix.csv")
make_corLong<- function(snpsGeno,SampleDataPath,ID_col="ID"){
    snpCor = cor(snpsGeno,use="pairwise.comp")
    snpCor[lower.tri(snpCor, diag=TRUE)] = NA
    corLong = data.frame(cor = signif(as.numeric(snpCor),3))
    corLong$rowSample = rep(colnames(snpsGeno), times = ncol(snpsGeno))
    corLong$colSample = rep(colnames(snpsGeno), each = ncol(snpsGeno))
    corLong = corLong[!is.na(corLong$cor),]
#    return(corLong)
    sampleData<-read.csv(SampleDataPath)
    colnames(sampleData)<-paste0("row",colnames(sampleData))
    corLong<-dplyr::left_join(corLong,sampleData, by = c("rowSample" = paste0("row",ID_col)))
    colnames(sampleData)<-gsub("row","col",colnames(sampleData))
    corLong<-dplyr::left_join(corLong,sampleData, by = c("colSample" = paste0("col",ID_col)))
    return(corLong)
#     corLong$rowBrain <- brain_sentrix_present$BrNum[brain_sentrix_match_row]
#     corLong$colBrain <- brain_sentrix_present$BrNum[brain_sentrix_match_col]
#     corLong$rowBatch <- brain_sentrix_present$Batch[brain_sentrix_match_row]
#     corLong$colBatch <- brain_sentrix_present$Batch[brain_sentrix_match_col]
}
