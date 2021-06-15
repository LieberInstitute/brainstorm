## code to prepare `called` dataset goes here

snpsCalled_VCF <- VariantAnnotation::readVcf(here("data-raw","mergedVariants.vcf.gz"),genome = "hg38")
usethis::use_data(snpsCalled_VCF, overwrite = TRUE)
