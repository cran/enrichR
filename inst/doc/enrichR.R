## ----echo = FALSE, eval = TRUE------------------------------------------------
websiteLive <- TRUE

## ----echo = TRUE, eval = FALSE------------------------------------------------
# library(devtools)
# install_github("wjawaid/enrichR")

## ----echo = TRUE, eval = FALSE------------------------------------------------
# install.packages("enrichR")

## ----echo = TRUE, eval = TRUE-------------------------------------------------
library(enrichR)

websiteLive <- getOption("enrichR.live")

if (websiteLive) {
    listEnrichrSites()
    setEnrichrSite("Enrichr") # Human genes
}

## ----echo = TRUE, eval = TRUE-------------------------------------------------
if (websiteLive) {
    dbs <- listEnrichrDbs()
    head(dbs)
}

## ----echo = TRUE, eval = TRUE-------------------------------------------------
dbs <- c("GO_Molecular_Function_2023", "GO_Cellular_Component_2023", 
	 "GO_Biological_Process_2023")

## ----echo = TRUE, eval = TRUE-------------------------------------------------
# Load example input genes
data(input)
length(input)
head(input)

if (websiteLive) {
    enriched <- enrichr(input, dbs)
}

## ----echo = TRUE, eval = FALSE------------------------------------------------
# if (websiteLive) head(enriched[["GO_Biological_Process_2023"]])

## ----echo = FALSE, results = 'asis'-------------------------------------------
success <- websiteLive & (length(enriched) >= 3)
success <- success & all(dim(enriched[["GO_Biological_Process_2023"]]) > 2)
if (success) {
    x <- head(enriched[["GO_Biological_Process_2023"]])
    x[,1] <- gsub(":", "&#58;", x[,1])
    knitr::kable(x)
}

## ----echo = TRUE, eval = TRUE-------------------------------------------------
# Load example background
data(background)
length(background)
head(background)

if (websiteLive) {
    enriched2 <- enrichr(input, dbs, background = background)
}

## ----echo = TRUE, eval = FALSE------------------------------------------------
# if (websiteLive) head(enriched2[["GO_Biological_Process_2023"]])

## ----echo = FALSE, results = 'asis'-------------------------------------------
success <- websiteLive & (length(enriched2) >= 3)
success <- success & all(dim(enriched2[["GO_Biological_Process_2023"]]) > 2)
if (success) {
    x <- head(enriched2[["GO_Biological_Process_2023"]])
    x[,1] <- gsub(":", "&#58;", x[,1])
    knitr::kable(x)
}

## ----echo = TRUE, eval = TRUE-------------------------------------------------
if (websiteLive) {
    # Replace 'Rank' with 'Overlap' column, calculated with GMT files
    enriched3 <- enrichr(input, dbs, background = background, include_overlap = TRUE)
}

## ----echo = FALSE, results = 'asis'-------------------------------------------
success <- (length(enriched3) >= 3) & all(dim(enriched3[["GO_Biological_Process_2023"]]) > 2)
if (success) {
    x <- head(enriched3[["GO_Biological_Process_2023"]])
    x[,1] <- gsub(":", "&#58;", x[,1])
    knitr::kable(x)
}

## ----echo = TRUE, eval = TRUE, fig.width = 8, fig.height = 5, fig.align = "center", dpi = 100----
if (websiteLive) {
    plotEnrich(enriched[["GO_Biological_Process_2023"]], showTerms = 20, numChar = 40, 
	       y = "Count", orderBy = "P.value")
}

## ----echo = TRUE, eval = FALSE------------------------------------------------
# # To text files
# printEnrich(enriched)
# 
# # To Excel
# printEnrich(enriched, outFile = "excel")

## ----echo = TRUE, eval = FALSE------------------------------------------------
# options(RCurlOptions = list(proxy = 'http://ip_or_url',
#                             proxyusername = 'myuser',
#                             proxypassword = 'mypwd',
#                             proxyport = 'port_num',
#                             proxyauth = 'basic'))

