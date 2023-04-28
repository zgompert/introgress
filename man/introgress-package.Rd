\name{introgress-package}
\alias{introgress-package}
\docType{package}
\title{introgress}
\description{
\code{introgress} provides functions for analyzing introgression
of genotypes between divergent, hybridizing lineages, including
estimating genomic clines from multi-locus genotype data and testing for
deviations from neutral expectations. Functions are also provided for
maximum likelihood estimation of molecular hybrid index and graphical analysis.    
}

\details{
\code{introgress} includes several core functions that are needed to
implement the genomic clines method of Gompert and Buerkle
(2009a). \code{\link{prepare.data}} estimates the counts of alleles
inherited from each of two parental population at each locus for admixed
individuals. These estimates are based on genotype data from admixed
population(s) and specified parental populations. The function
\code{\link{est.h}} uses the list output returned from
\code{\link{prepare.data}} and the raw genotype data for the admixed
population(s) to compute maximum likelihood estimates of hybrid
index. The list output returned by \code{\link{prepare.data}} and the
data.frame output returned by \code{\link{est.h}} are used to estimate
genomic clines, which is accomplished with the function
\code{\link{genomic.clines}}. The \code{\link{genomic.clines}} function includes
arguments specifying whether significance testing is performed and the
procedure used to generate null expectations for significance
testing. The \code{\link{clines.plot}} function provides graphical
output for genomic clines analysis similar to Gompert and Buerkle
(2009a, 2009b). In addition, the \code{introgress} package includes the
\code{\link{compare.clines}} function to contrast patterns of
introgression between hybrid zones.

\code{introgress} implements additional functions for graphical analysis
of hybrid zones. \code{\link{triangle.plot}} plots the relationship
between hybrid index and inter-class heterozygosity
(\code{\link{calc.intersp.het}}) for an admixed population. The
\code{\link{mk.image}} function produces a graphical representation of
marker ancestry allowing visual inspection of variation in patterns of
introgression among markers.

For further information regarding the above functions and additional
\code{introgress} functions, please see the appropriate function help pages.
}


\references{
  Gompert Z. and Buerkle C. A. (2009) A powerful regression-based
method for admixture mapping of isolation across the genome of
hybrids. \emph{Molecular Ecology}, \bold{18}, 1207-1224.

Gompert Z. and Buerkle C. A. (2009) \emph{introgress}: a software
package for mapping components of isolation in hybrids. \emph{Molecular
  Ecology Resources}, \emph{in preparation}.  

} 

\author{
Zachariah Gompert \email{zgompert@uwyo.edu}, C. Alex Buerkle \email{buerkle@uwyo.edu}
}  


