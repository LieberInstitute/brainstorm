## code to prepare `genotyped` dataset goes here

## Originally at:
# /dcl01/ajaffe/data/lab/brain_swap/LIBD_Brain_merged_topmed_RNASeq_annotated_variants_043020.vcf
genotyped <- VariantAnnotation::readVcf("data/LIBD_Brain_merged_topmed_RNASeq_annotated_variants_043020.vcf",
    genome = "hg38"
)
usethis::use_data(genotyped, overwrite = TRUE)
