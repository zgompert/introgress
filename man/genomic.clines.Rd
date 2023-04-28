\name{genomic.clines}
\alias{genomic.clines}
\title{Genomic Clines}
\description{
This function fits genomic clines to genotypic data
using the method described by Gompert and Buerkle (2009a). Significance
testing is included, but optional. 

}
\usage{
genomic.clines(introgress.data=NULL, hi.index=NULL, loci.data=NULL,
               sig.test=FALSE, method="permutation", n.reps=1000,
               classification=FALSE,het.cor=TRUE, loci.touse=NULL, ind.touse=NULL)
}
\arguments{
\item{introgress.data}{a list produced by
  \code{prepare.data} or a matrix with allele counts.}

\item{hi.index}{a data frame produced by \code{est.h} or a
  numeric vector of hybrid index estimates.}

\item{loci.data}{a matrix or array providing marker information.}

\item{sig.test}{a logical specifying whether to perform significance
  testing.}

\item{method}{method to generate null distribution; either "permutation"
  or "parametric".}

\item{n.reps}{numeric value specifying number of neutral simulations.}

\item{classification}{a logical specifying whether to calculate genotype
  specific quantiles (ignored if sig.test=FALSE).}

\item{het.cor}{a logical specifying whether to correct for deviations
  from expected heterozygosity when conducting neutral simulations using
  the parametric method (ignored with permutation method).}

\item{loci.touse}{vector of loci names, numeric indexes, or logicals
  that specify a subset of loci for analysis, if \code{NULL} all loci
  are included.}

\item{ind.touse}{vector of individual identifications, numeric indexes,
  or logicals that specify a subset of individuals for analysis, if
  \code{NULL} all individuals are included.}  }

\details{ 

  \code{introgress.data} may either be the list that is returned by the
function \code{prepare.data}, or, if \code{fixed=TRUE},
\code{introgress.data} may simply be a matrix or array providing counts
of the number of alleles derived from parental population 1 for each
admixed individual. If \code{introgress.data} is a matrix or array, rows
and columns correspond to loci and individuals, respectively.

\code{loci.data} is a matrix or array where each row provides
information on one locus. The first column gives a unique locus name
(e.g. \emph{"locus3"}), and the second column specifies whether the
locus is co-dominant (\emph{"C"} or \emph{"c"}), haploid (\emph{"H"} or
\emph{"h"}), or dominant (\emph{"D"} or \emph{"d"}). These first two
columns in \code{loci.data} are required. The third column, which is
optional, is a numeric value specifying the linkage groups for the
marker. The fourth column, which is also optional, is a numeric value
specifying both the linkage group and location on the linkage group
(e.g. \emph{3.70}, for a marker at 70 cM on linkage group 3). These
optional columns can be used for ordering markers for the
\code{mk.image}, \code{genomic.clines}, and \code{clines.plot}
functions.

This function (\code{genomic.clines}) estimates genomic clines in
genotype frequency for admixed populations using the genomic clines
method described by Gompert and Buerkle (2009a). If \code{sig.test =
FALSE}, genomic clines are estimated for the admixed population, but no
significance testing is done. If \code{sig.test = TRUE}, the genomic
cline for each locus is evaluated for deviations from neutral
expectations. Either the permutation method (\code{method =
"permutation"}) or the parametric method (\code{method = "parametric"})
described by Gompert and Buerkle (2009a) can be used to generate the
neutral distribution for significance testing. The permutation method
cannot be used if both co-dominant and dominant (or haploid) data are
included in the analysis. If \code{classification = TRUE} this function
also returns the proportion of neutral simulations/permutations yielding
a model with a higher total probability of a given genotype for a given
marker than the model from the observed data

The function will issue a warning if an invariant locus is included (all
individuals have the same genotype).  In this case the probability of
one of the genotypes does not vary with hybrid index.

See Gompert and Buerkle (2009a, 2009b) for additional details.
}

\value{
A list with the following components:

\item{Summary.data}{a matrix with the locus data including log
  likelihood ratios and P-values from significance testing if
  \code{sig.test = TRUE}.}

\item{Fitted.AA}{a matrix with fitted values for the population 1
  homozygote for each locus (row) and individual (column).}

\item{Fitted.Aa}{a matrix with fitted values for inter-population
  heterozygotes for each locus (row) and individual (column).}

\item{Fitted.aa}{a matrix with fitted values for the population 2
  homozygote for each locus (row) and individual (column).}

\item{Neutral.AA}{a matrix with upper and lower bounds for the empirical
  95\% confidence interval for the expected population 1 homozygote
  genomic clines under neutrality for each locus (row) and individual
  (column); these confidence intervals are based on the neutral
  simulations/permutations.}

\item{Neutral.Aa}{a matrix with upper and lower bounds for the empirical
  95\% confidence interval for the expected inter-population heterozygote
  genomic clines under neutrality for each locus (row) and individual
  (column); these confidence intervals are based on the neutral
  simulations/permutations.}

\item{Neutral.aa}{a matrix with upper and lower bounds for the empirical
  95\% confidence interval for the expected population 2 homozygote
  genomic clines under neutrality for each locus (row) and individual
  (column); these confidence intervals are based on the neutral
  simulations/permutations.}

\item{Count.matrix}{the user supplied \code{count.matrix}.}

\item{hybrid.index}{the user supplied \code{hi.index}.}

\item{Loci.data}{the user supplied \code{loci.data}.}

\item{Quantiles}{a matrix with the proportion of neutral
  simulations/permutations yielding a model with a higher total probability
  of a given genotype (column) than the model from the observed data;
  proportions are provided for each locus (row).}

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

\seealso{
\code{\link{prepare.data}}, \code{\link{est.h}}
 } 
 
\examples{
\dontrun{
## Example 1, genomic clines analysis without significance testing, or
## with significance testing on a subset of the data

## load simulated data
## markers do not have fixed differences
data(AdmixDataSim2)
data(LociDataSim2)
data(p1DataSim2)
data(p2DataSim2)

## use prepare.data to produce introgress.data
introgress.data1<-prepare.data(admix.gen=AdmixDataSim2,
                               loci.data=LociDataSim2,
                               parental1=p1DataSim2, parental2=p2DataSim2,
                               pop.id=TRUE, ind.id=TRUE, fixed=FALSE)

## estimate hybrid index
hi.index1<-est.h(introgress.data=introgress.data1,loci.data=LociDataSim2,
                 fixed=FALSE)

## estimate genomic clines without significance testing
clines.out1<-genomic.clines(introgress.data=introgress.data1,
                            hi.index=hi.index1,
                            loci.data=LociDataSim2, sig.test=FALSE)

## for a subset of loci, estimate genomic clines with significance testing
clines.out1b<-genomic.clines(introgress.data=introgress.data1,
                             hi.index=hi.index1,
                             loci.data=LociDataSim2, sig.test=TRUE,
                             method="parametric", loci.touse=1:10)

###############################################################
## Example 2, genomic clines analysis with significance testing

## load simulated data
## markers have fixed differences, with
## alleles coded as 'P1' and 'P2'
data(AdmixDataSim1)
data(LociDataSim1)

## use prepare.data to produce introgress.data
introgress.data2<-prepare.data(admix.gen=AdmixDataSim1,
                               loci.data=LociDataSim1,
                               parental1="P1", parental2="P2",
                               pop.id=FALSE, ind.id=FALSE, fixed=TRUE)

## estimate hybrid index
hi.index2<-est.h(introgress.data=introgress.data2,
                loci.data=LociDataSim1, fixed=TRUE, p1.allele="P1",
                p2.allele="P2")

## estimate genomic clines and perform significance testing
## note the small number of replicates (chosen only to speed example)
clines.out2<-genomic.clines(introgress.data=introgress.data2,
                            hi.index=hi.index2, loci.data=LociDataSim1,
                            sig.test=TRUE, method="permutation",
                            classification=TRUE,n.reps=100)

write.table(clines.out2$Summary.data, file="clines.txt",
            quote=FALSE, sep=",")
}
}


