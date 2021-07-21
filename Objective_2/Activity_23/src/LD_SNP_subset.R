library(gdsfmt)
library(SNPRelate)

vcf <- "./../data/genotype/GCDT_plates_fix_Vulgaris_v2_Bi_Q40_Dp3_imiss83_NS99_MAF2_He2_annotated.vcf.gz"
snpgdsVCF2GDS(vcf, "./../processed_data/genotype/GCDT_plates_fix_Vulgaris_v2_Bi_Q40_Dp3_imiss83_NS99_MAF2_He2_annotated.gds", method="biallelic.only")
snpgdsSummary("./../processed_data/genotype/GCDT_plates_fix_Vulgaris_v2_Bi_Q40_Dp3_imiss83_NS99_MAF2_He2_annotated.gds")

genofile <- snpgdsOpen("./../processed_data/genotype/GCDT_plates_fix_Vulgaris_v2_Bi_Q40_Dp3_imiss83_NS99_MAF2_He2_annotated.gds")
snpset <- snpgdsLDpruning(genofile, ld.threshold=0.2, num.thread=1, missing.rate = 0.2, slide.max.bp = 200000, maf = 0.05)
names(snpset)
snpset.id <- unlist(snpset)

snpgdsGDS2BED(genofile, bed.fn="./../processed_data/genotype/GCDT_plates_fix_Vulgaris_v2_Bi_Q40_Dp3_imiss83_NS99_MAF2_He2_LD_prunning", sample.id=NULL, snp.id=snpset.id)
snpgdsGDS2PED(genofile, ped.fn="./../processed_data/genotype/GCDT_plates_fix_Vulgaris_v2_Bi_Q40_Dp3_imiss83_NS99_MAF2_He2_LD_prunning", sample.id=NULL, snp.id=snpset.id)
