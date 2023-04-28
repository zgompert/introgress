\name{delta}
\alias{delta}
\title{Delta}

\description{ This function calculates delta (\eqn{\delta}), the differential
between allelic frequencies in two populations. It is called by the
function \code{prepare.data}.}

\usage{
delta(SpA, SpB)
}

\arguments{
\item{SpA}{a vector of population allele frequencies.}
\item{SpB}{a vector of population allele frequencies.}
}  

\details{
This function calculates the allele frequency differential for a pair of
species or populations (\eqn{\delta}, Gregorius and Roberds 1986) for a
single locus.

\deqn{\delta = \sum_{i} \frac{|f_{i1} - f_{i2}|}{2}}{%
  delta = sigma(|f_i1 - f_i2|/2)}

where \eqn{f_{i1}} and \eqn{f_{i2}} denote the frequency of the
\emph{i}th allele in populations one and two, respectively.
\eqn{\delta} ranges from 0, for identical populations, to 1, for
populations that share no alleles in common.  }

\value{
This function returns a vector of length one with the value of \eqn{\delta}.  
}

\references{
Gregorius, H. R. and Roberds, J. H. (1986) Measurement of genetical
differentiation among subpopulations. \emph{Theoretical and Applied
  Genetics}, \bold{71}, 826-834.
 } 

\author{
Zachariah Gompert \email{zgompert@uwyo.edu}, C. Alex Buerkle \email{buerkle@uwyo.edu}
}  

\seealso{
\code{\link{prepare.data}}
 } 
 
\examples{
## allele frequencies for two populations
pop.a<-c(0.3,0.5,0.2)
pop.b<-c(0.1,0.1,0.8)

## delta calculation
delta(pop.a,pop.b)
}

