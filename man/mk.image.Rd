\name{mk.image}
\alias{mk.image}
\title{Make Image}
\description{
This function produces a graphical representation of marker ancestry
across individuals and facilitates visual inspection of variation in
patterns of introgression among markers.
}

\usage{
mk.image(introgress.data=NULL, loci.data=NULL,
         marker.order=NULL, hi.index=NULL, ind.touse=NULL,
         loci.touse=NULL, ylab.image="Individuals", main.image="",
         xlab.h="population 2 ancestry", col.image=NULL,
         pdf=TRUE, out.file="image.pdf")
}
\arguments{

  \item{introgress.data}{a list produced by \code{prepare.data} or a
    matrix with allele counts.}

  \item{loci.data}{a matrix or array providing marker information.}

  \item{marker.order}{a numeric or character vector specifying the order
    in which to plot markers, if \code{marker.order=NULL} the markers
    will be plotted in the order in which they occur in the
    \code{introgress.data}.}

  \item{hi.index}{a data frame produced by \code{est.h} or a numeric
    vector of hybrid index estimates.}
  
  \item{ind.touse}{vector specifying a subset of individuals to plot, if
    \code{ind.touse=NULL} all individuals will be included.}

  \item{loci.touse}{vector specifying a subset of markers to plot, if
    \code{loci.touse=NULL} all markers will be included.}

  \item{ylab.image}{character string giving the label for the y-axis.}

  \item{main.image}{character string giving the main label for the plot.}

  \item{xlab.h}{character string giving the x-axis label for the hybrid
    index portion of the plot.}

  \item{col.image}{vector of three colors to be used for the image plot,
    if \code{col.image=NULL} default colors will be used.}

  \item{pdf}{a logical specifying whether to print the plot to a pdf, if
    \code{pdf=FALSE} the current graphical output device will be used.}

  \item{out.file}{character string specifying the name of the output
    file for the image, if \code{pdf=TRUE}.}

}  

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
marker.  The fourth column, which is also optional, is a numeric value
specifying both the linkage group and location on the linkage group
(e.g. \emph{3.70}, for a marker at 70 cM on linkage group 3).  If
present, the third column will be used to draw breaks between and label
linkage groups.  The fourth column can be used to generate an order in
which to plot markers (specified in \code{marker.order}).

This function (\code{mk.image}) produces a plot of marker specific
ancestry for each individual. Each row corresponds to an individual and
each column to a marker. Each marker/individual combination is colored
dark green for homozygotes for alleles from parental population 1
(allele count of 2),
medium green for interspecific heterozygotes (allele count of 1), light
green for homozygotes for alleles from parental population 2
(allele count of 0), or white (missing data). Individuals are ordered
according to hybrid index estimates, which are plotted to the right of
the main plot.  }

\value{
  A plot is produced, but no value is returned.  
}

\references{
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
## load simulated data
## markers have fixed differences, with
## alleles coded as 'P1' and 'P2'
data(AdmixDataSim1)
data(LociDataSim1)

## use prepare.data to produce introgress.data
introgress.data<-prepare.data(admix.gen=AdmixDataSim1,
                              loci.data=LociDataSim1,
                              parental1="P1", parental2="P2", pop.id=FALSE, 
                              ind.id=FALSE, fixed=TRUE)

## estimate hybrid index
hi.index<-est.h(introgress.data=introgress.data,
                loci.data=LociDataSim1, fixed=TRUE, p1.allele="P1",
                p2.allele="P2")

## produce image plot of marker ancestry
mk.image(introgress.data=introgress.data, loci.data=LociDataSim1,
         marker.order=NULL, hi.index=hi.index, ind.touse=NULL,
         loci.touse=NULL, ylab.image="Individuals", main.image="",
	 xlab.h="population 2 ancestry", col.image=NULL,
	 pdf=TRUE, out.file="image.pdf")
}
}
