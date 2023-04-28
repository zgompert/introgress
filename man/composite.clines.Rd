\name{composite.clines}
\alias{composite.clines}
\title{Composite Clines Plot}
\description{
This function produces an overlayed graphical plot of genomic clines using the
output from the function \code{genomic.clines}. 

}
\usage{
composite.clines(cline.data=NULL,pdf=TRUE,out.file="comp.pdf",
                colors=c("#005A32","#41AB5D"),labels=c("AA","Aa"))
}
\arguments{
  
  \item{cline.data}{a list that is the product of the
    \code{genomic.clines} function.}
    
  \item{pdf}{logical specifying whether to print the plots to a pdf file;
    if \code{pdf=FALSE} plots are printed to the current graphical
    device.}
  
  \item{out.file}{a character string for the filename for the
    output if \code{pdf=TRUE}.}

  \item{colors}{a vector of two colors to be used for cline plots.}

  \item{labels}{vector with two characters used for labeling marker
    genotypes on the plots.}

}  

\details{
  
This function produces graphical plots based on the data object produced
by the \code{genomic.clines} function. Plots depict the probability of a
given genotype as a function of hybrid index. Unlike the
\code{clines.plot} function, plots for each marker are overlayed. If
significance testing was performed the null distribution of the first
marker is shown (which should be the same as the null distribution for
all markers if the permutation method was used). This function only works
with co-dominant markers. See Teeter et al. 2010 for an example of the
plot produced by this function. Also, compare this function to
\code{clines.plot}.  

}

\value{
A plot is produced, but a data object is not returned.  
}
  
\references{
Gompert Z. and Buerkle C. A. (2009) A powerful regression-based
method for admixture mapping of isolation across the genome of
hybrids. \emph{Molecular Ecology}, \bold{18}, 1207-1224.

Teeter K. C., Thibodeau L. M., Gompert Z., Buerkle C. A., Nachman M. W.,
and Tucker, P. K. (2010) The variable genomic architecture of isolation
between hybridizing species of house mice. \emph{Evolution}, \bold{64},
472-485. 

} 

\author{
Zachariah Gompert \email{zgompert@uwyo.edu}, C. Alex Buerkle \email{buerkle@uwyo.edu}
}  

\seealso{
\code{\link{genomic.clines}}, \code{\link{clines.plot}}
 } 
 
\examples{
## this code assumes the data object clines.out2 has been produced using
## the sample code for the "genomic.clines" function

## produce plots of genomic clines 
\dontrun{
composite.clines(cline.data=clines.out2)
}
} 
