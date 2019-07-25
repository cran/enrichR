---
title: "An R interface to the Enrichr database"
author: "Wajid Jawaid"
email: "wj241@cam.ac.uk"
date: "2019-07-18"
bibliography: ./vignettes/enrichr.bib
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/enrichR)](https://cran.r-project.org/package=enrichR)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![CRAN mirror downloads](http://cranlogs.r-pkg.org/badges/enrichR)](https://cran.r-project.org/package=enrichR/)

# Installation

**enrichR** can be installed from Github or soon from CRAN.

## Github


```r
library(devtools)
install_github("wjawaid/enrichR")
```

## CRAN

The package can be downloaded from CRAN using:


```r
install.packages("enrichR")
```

# Usage example

**enrichR** provides an interface to the Enrichr database [@kuleshov_enrichr:_2016] hosted at http://amp.pharm.mssm.edu/Enrichr.  

First find the list of all available databases from Enrichr.


```r
library(enrichR)
dbs <- listEnrichrDbs()
```


```r
head(dbs)
```


     libraryName                         numTerms   geneCoverage   genesPerTerm  link                                                     
---  ---------------------------------  ---------  -------------  -------------  ---------------------------------------------------------
1    Genome_Browser_PWMs                      615          13362            275  http://hgdownload.cse.ucsc.edu/goldenPath/hg18/database/ 
2    TRANSFAC_and_JASPAR_PWMs                 326          27884           1284  http://jaspar.genereg.net/html/DOWNLOAD/                 
3    Transcription_Factor_PPIs                290           6002             77                                                           
5    Drug_Perturbations_from_GEO_2014         701          47107            509  http://www.ncbi.nlm.nih.gov/geo/                         
6    ENCODE_TF_ChIP-seq_2014                  498          21493           3713  http://genome.ucsc.edu/ENCODE/downloads.html             

View and select your favourite databases. Then query enrichr, in this case I have used genes associated with embryonic haematopoiesis.


```r
dbs <- c("GO_Molecular_Function_2015", "GO_Cellular_Component_2015", "GO_Biological_Process_2015")
enriched <- enrichr(c("Runx1", "Gfi1", "Gfi1b", "Spi1", "Gata1", "Kdr"), dbs)
#> Uploading data to Enrichr... Done.
#>   Querying GO_Molecular_Function_2015... Done.
#>   Querying GO_Cellular_Component_2015... Done.
#>   Querying GO_Biological_Process_2015... Done.
#> Parsing results... Done.
```

Now view the results table.


```r
enriched[["GO_Biological_Process_2015"]]
```

You can give many genes.

```r
data(genes790)
length(genes790)
head(enrichr(genes790, c('LINCS_L1000_Chem_Pert_up'))[[1]])
```


Term                                                               Overlap    P.value   Adjusted.P.value   Old.P.value   Old.Adjusted.P.value   Odds.Ratio   Combined.Score  Genes                  
-----------------------------------------------------------------  --------  --------  -----------------  ------------  ---------------------  -----------  ---------------  -----------------------
embryonic hemopoiesis (GO_0035162)                                 3/24       0.0e+00          0.0001573             0                      0    416.66667         7213.540  KDR;GATA1;RUNX1        
regulation of myeloid cell differentiation (GO_0045637)            4/156      1.0e-07          0.0001370             0                      0     85.47009         1432.245  GFI1B;SPI1;GATA1;RUNX1 
regulation of erythrocyte differentiation (GO_0045646)             3/36       1.0e-07          0.0001847             0                      0    277.77778         4459.220  GFI1B;SPI1;GATA1       
positive regulation of myeloid cell differentiation (GO_0045639)   3/74       1.0e-06          0.0012521             0                      0    135.13514         1871.822  GFI1B;GATA1;RUNX1      
hemopoiesis (GO_0030097)                                           3/95       2.1e-06          0.0021339             0                      0    105.26316         1378.448  KDR;GATA1;RUNX1        
hematopoietic progenitor cell differentiation (GO_0002244)         3/106      2.9e-06          0.0024754             0                      0     94.33962         1204.196  SPI1;GATA1;RUNX1       

# References
