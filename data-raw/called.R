## code to prepare `called` dataset goes here
library(VariantAnnotation)
library(jaffelab)

## Originally at:
# /dcl01/ajaffe/data/lab/brain_swap/RNAseq_Collection_postQC_n5568_10dataset_2020-07-22_hg38.vcf.gz
called <- VariantAnnotation::readVcf("Data/RNAseq_Collection_postQC_n5568_10dataset_2020-07-22_hg38.vcf.gz",
    genome = "hg38"
)

## Originally at:
# /dcl01/ajaffe/data/lab/brain_swap/common_missense_SNVs_hg38.bed
snpMap_hg38 <- import("Data/common_missense_SNVs_hg38.bed")
snpMap_hg38$chrpos <- paste0(seqnames(snpMap_hg38), ":", start(snpMap_hg38))

## Originally at:
# TODO
pd <- read.csv("Data/pd_swap.csv")

colData(called)$SampleID <- sapply(strsplit(colnames(called), "/"), function(x) x[length(x)])
colData(called)$SampleID <- ss(colData(called)$SampleID, "_accepted_hits")

## take first
pd$firstSample <- ss(pd$SAMPLE_ID, ";")
message("All samples in pd in called: ", all(pd$firstSample %in% colData(called)$SampleID))

## put in order
called <- called[, match(pd$firstSample, colData(called)$SampleID)]
colnames(called) <- colData(called)$SampleID

## merge pheno
colData(called) <- cbind(colData(called), pd[, -ncol(pd)])

#### fix labels ####
rowRanges(called)$chrpos <- ss(rownames(called), "_")
rowRanges(called)$snpRsNum <- snpMap_hg38$name[match(rowRanges(called)$chrpos, snpMap_hg38$chrpos)]
rownames(called) <- rowRanges(called)$snpRsNum

usethis::use_data(called, overwrite = TRUE)
