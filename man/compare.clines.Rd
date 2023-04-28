\name{compare.clines}
\alias{compare.clines}
\title{Compare Clines}
\description{
This function contrasts patterns of introgression between two hybrid zones. 

}
\usage{
compare.clines(cline.data1=NULL,cline.data2=NULL,sig.test=FALSE,
               n.reps=1000)
}
\arguments{
  
  \item{cline.data1}{a list that is the product of the
    \code{genomic.clines} function.}
  
  \item{cline.data2}{a list that is the product of the
    \code{genomic.clines} function.}
  \item{sig.test}{a logical specifying whether to perform significance
    testing.}
  \item{n.reps}{numeric value specifying the number of permutations to
    conduct for signficance testing.}
  
}  

\details{
  
This function estimates that likelihood of the count data from
\code{cline.data2} given the regression models from \code{cline.data1}
and \code{cline.data2} and returns the log ratio of the
latter to the former. \code{cline.data1} and \code{cline.data2} are
lists returned by \code{genomic.clines} each based on a different hybrid
zone between the same parental populations or species; the molecular
markers and parental allele frequencies should be the same for both
hybrid zones. The range of hybrid index estimates for individuals
comprising \code{cline.data2} should exceed the range of hybrid index
estimated for individuals comprising \code{cline.data1} to avoid
predicting allele counts using the regression model from
\code{cline.data1} beyond the range of hybrid indexes that were included
in the original model. The log likelihood ratios returned by this
function can be used to determine the degree of congruence for marker
specific patterns of introgression between the analyzed hybrid
zones. This function includes a permutation procedure for testing
whether log likelihood ratios are significantly greater than expected by
chance, which is invoked by setting \code{sig.test = TRUE}. This option
should only be employed when both hybrid zones contain many individuals
with low and high hybrid index estimates to minimized the problem
described above.
  
See Gompert and Buerkle (2009a, 2009b) for additional details and examples.
}

\value{
A matrix with log likelihood ratios for each marker and P-values from
significance testing if \code{sisg.test = TRUE}.  
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
\code{\link{genomic.clines}}, \code{\link{prepare.data}}, \code{\link{est.h}}
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
                               pop.id=FALSE, ind.id=FALSE, fixed=TRUE)

## estimate hybrid index
hi.index<-est.h(introgress.data=introgress.data,
                loci.data=LociDataSim1, p1.allele="P1",
                p2.allele="P2")

## random sampling to divide data into two sets of 100 individuals,
## this creates two admixed populations (hybrid zones)
numbs<-sample(1:200,200,replace=FALSE)
sam1<-numbs[1:100]
sam2<-numbs[101:200]

## estimate genomic clines for each data set,
## significance testing is not conducted
clines.out1<-genomic.clines(introgress.data=introgress.data,
                            hi.index=hi.index,loci.data=LociDataSim1,
                            sig.test=FALSE, ind.touse=sam1)

clines.out2<-genomic.clines(introgress.data=introgress.data,
                            hi.index=hi.index,loci.data=LociDataSim1,
                            sig.test=FALSE, ind.touse=sam2)

## compare clines between data sets, with significance testing
comp.out<-compare.clines(clines.out1,clines.out2,sig.test=TRUE,
                         n.reps=1000)

write.table(comp.out, file="compareClines.txt",
            quote=FALSE, sep=",")
}
} 
