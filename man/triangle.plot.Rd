\name{triangle.plot}
\alias{triangle.plot}
\title{Triangle Plot}
\description{
This function makes a plot of interspecific heterozygosity as a function
of hybrid index. 

}
\usage{
triangle.plot(hi.index=NULL, int.het=NULL, pdf=TRUE,
              out.file="tri_plot.pdf")
}
\arguments{

  \item{hi.index}{a data frame produced by \code{est.h} or a numeric
    vector of hybrid index estimates.}

  \item{int.het}{a vector of numeric interspecific heterozygosity
    estimates.}

  \item{pdf}{a logical specifying whether results should be output to a
    pdf file.}

  \item{out.file}{a character string specifying the name of the output
    file if \code{pdf=TRUE}.}
  
}  

\details{ This function plots interspecific heterozygosity as a function
of hybrid index for individuals from an admixed population.  Individuals
that are the progeny of at least one parent from one of the pure
parental populations should have maximal heterozygosity for the observed
hybrid index.  The plot has lines that correspond to these theoretical
maximum values.  Individuals that fall on the maximal line are likely
F1s or backcross progeny.  Evidence for individuals of this type will be
more likely if the data set consists of loci with no alleles in common
between parental species (\code{\link{delta}=1}), whereas shared alleles
will lead to ambiguity in inferring ancestry.  Hybrid index estimates
can be obtained from the \code{est.h} function and interspecific
heterozygosity estimates can be obtained from the
\code{calc.intersp.het} function.  }

\value{
  A plot is produced, but there is no return value.
}

%% \references{
%% \emph{??}    
%% } 

\author{
Zachariah Gompert \email{zgompert@uwyo.edu}, C. Alex Buerkle \email{buerkle@uwyo.edu}
}  

\seealso{
  \code{\link{est.h}}, \code{\link{calc.intersp.het}}, \code{\link{delta}}
} 
 
\examples{
## produce triangle plots
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
                loci.data=LociDataSim1, fixed=TRUE, p1.allele="P1",
                p2.allele="P2")

## Estimate interspecific heterozygosity
int.het<-calc.intersp.het(introgress.data=introgress.data)

## make plot
triangle.plot(hi.index=hi.index, int.het=int.het, pdf=FALSE)
}
