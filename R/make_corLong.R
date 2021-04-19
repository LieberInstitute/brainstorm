#' Title
#'
#' @param snpsGeno
#' @param brainsentrix
#'
#' @return
#' @export
#'
#' @examples
#' x<-make_corLong(snps1 = test_snps,BrainTable1 = test_BrTable,BrainTable2 = test_BrTable,ID_col1 = "Sample",ID_col2 = "Sample")
#'
#' snpsGeno<-make_snpsGeno(genotyped)
#' jaffelab::corner(snpsGeno)
#' brain_sentrix<-read.csv("Data/brain_sentrix.csv")
#' corLongtest<-make_corLong(snpsGeno,BrainTable1=brain_sentrix)
#'
#'corLongtest<-make_corlong
make_corLong<- function(snps1,snps2=snps1,BrainTable1,BrainTable2=BrainTable1, ID_col1="ID",ID_col2=ID_col1){
    snpCor = cor(snps1,snps2, use="pairwise.comp")
    rownames(snpCor) = colnames(snps1)
    colnames(snpCor) = colnames(snps2)
     snpCor[lower.tri(snpCor, diag=TRUE)] = NA
     corLong = data.frame(cor = signif(as.numeric(snpCor),3))
     corLong$row_sample = rep(rownames(snpCor), times = ncol(snpCor))
     corLong$col_sample = rep(colnames(snpCor), each = nrow(snpCor))
     corLong = corLong[!is.na(corLong$cor),]
     BrainTable3<-BrainTable2
     colnames(BrainTable1)<-paste0("row_",colnames(BrainTable1))
     colnames(BrainTable2)<-paste0("col_",colnames(BrainTable3))
    corLong<-dplyr::left_join(corLong,BrainTable1, by = c("row_sample" = paste0("row_",ID_col1)))
    corLong<-dplyr::left_join(corLong,BrainTable2, by = c("col_sample" = paste0("col_",ID_col2)))
    return(corLong)
}
## test permissions
