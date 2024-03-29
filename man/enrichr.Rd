% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{enrichr}
\alias{enrichr}
\title{Gene enrichment using Enrichr}
\usage{
enrichr(genes, databases = NULL)
}
\arguments{
\item{genes}{(Required). Character vector of gene names or data.frame of gene names in
in first column and a score between 0 and 1 in the other.}

\item{databases}{(Required). Character vector of databases to search.
See https://maayanlab.cloud/Enrichr/ for available databases.}
}
\value{
Returns a list of data.frame of enrichment terms, p-values, ...
}
\description{
Gene enrichment using Enrichr
}
\details{
Gene enrichment using Enrichr
}
\examples{
dbs <- listEnrichrDbs()
dbs <- c("GO_Molecular_Function_2018", "GO_Cellular_Component_2018",
         "GO_Biological_Process_2018")
enriched <- enrichr(c("Runx1", "Gfi1", "Gfi1b", "Spi1", "Gata1", "Kdr"), dbs)
}
\author{
Wajid Jawaid \email{wj241@alumni.cam.ac.uk}
}
