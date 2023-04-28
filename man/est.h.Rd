\name{est.h}
\alias{est.h}
\title{Estimate Hybrid Index}
\description{
This function finds maximum likelihood estimates of hybrid index as
described by Buerkle (2005). 

}
\usage{
est.h(introgress.data=NULL, loci.data=NULL, ind.touse=NULL,
      fixed=FALSE, p1.allele=NULL, p2.allele=NULL)

}
\arguments{
\item{introgress.data}{a list produced by
  \code{prepare.data} or a matrix with allele counts.}
\item{loci.data}{a matrix or array providing marker information.}
\item{ind.touse}{vector of individual identifications, numeric indexes,
  or logicals that specify a subset of individuals for analysis, if
  \code{NULL} all individuals are included.}
\item{fixed}{a logical specifying whether different alleles are fixed
  for each parental population for all markers.}
\item{p1.allele}{if \code{fixed=TRUE} provides the character used to
  specify parental population 1 alleles.}
\item{p2.allele}{if \code{fixed=TRUE} provides the character used to
  specify parental population 2 alleles.}
}  

\details{\code{introgress.data} may either be the list that is returned by the
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

If the parental populations exhibit fixed allelic differences for all
markers scored (i.e. \code{fixed=TRUE}) then \code{p1.allele} and
\code{p2.allele} should give the character used to specify alleles
derived from parental populations one and two, respectively
(e.g. \code{p1.allele="p1"} and \code{p2.allele="p2"}).

\code{est.h} uses a maximum likelihood method to estimate the hybrid
index for each admixed individual. This estimate is simply the
proportion of alleles derived from population 2 if \code{fixed=TRUE}.
In contrast, if populations share alleles (i.e. \code{fixed=FALSE}), the
estimate accounts for uncertainty in the ancestry of alleles, but the
estimate of hybrid index is still an estimate of the proportion of the
genome that is inherited from population 2. For each individual,
\code{est.h} returns a point estimate and 95\% confidence interval of
hybrid index.

See Buerkle (2005) for additional details.
}

\value{
  A data frame with point estimates of hybrid index and upper and lower
  limits of 95\% confidence intervals (interval of hybrid index that falls within
  two support units of the ML estimate):
\item{lower}{Lower limit of 95\% confidence interval.}
\item{h}{Maximum-likelihood estimate of hybrid index.}
\item{upper}{Upper limit of 95\% confidence interval.}
}

\references{
Buerkle C. A. (2005) Maximum-likelihood estimation of a hybrid index
based on molecular markers. \emph{Molecular Ecology Notes}, \bold{5}, 684-687.  

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
\code{\link{prepare.data}}
 } 
 
\examples{
\dontrun{
## load simulated data
## markers have fixed differences, with
## alleles coded as 'P1' and 'P2'
data(AdmixDataSim1)
data(LociDataSim1)

## use prepare.data to produce introgress.data
introgress.data<-prepare.data(admix.gen=AdmixDataSim1,
                              loci.data=LociDataSim1,
                              parental1="P1", parental2="P2",
                              pop.id=FALSE, ind.id=FALSE,
                              fixed=TRUE)

## estimate hybrid index
hi.index<-est.h(introgress.data=introgress.data,
                loci.data=LociDataSim1, ind.touse=NULL, fixed=TRUE,
                p1.allele="P1", p2.allele="P2")

write.table(hi.index, file="hindex.txt", quote=FALSE, sep=",")
}
}
