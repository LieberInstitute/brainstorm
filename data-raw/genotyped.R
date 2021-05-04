## code to prepare `genotyped` dataset goes here

genotyped <- VariantAnnotation::readVcf("Data/LIBD_Brain_merged_topmed_RNASeq_annotated_variants_043020.vcf",
    genome = "hg38"
)
usethis::use_data(genotyped, overwrite = TRUE)
