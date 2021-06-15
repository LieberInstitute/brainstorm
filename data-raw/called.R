## code to prepare `called` dataset goes here

called <- VariantAnnotation::readVcf(here("data-raw","mergedVariants.vcf.gz"),genome = "hg38")
usethis::use_data(called, overwrite = TRUE)
