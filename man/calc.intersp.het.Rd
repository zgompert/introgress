\name{calc.intersp.het}
\alias{calc.intersp.het}
\title{Calculate Interspecific Heterozygosity}

\description{ This function calculates interspecific heterozygosity of
individuals from a matrix of allele counts.  }

\usage{
calc.intersp.het(introgress.data=NULL)
}

\arguments{
  \item{introgress.data}{a list produced by \code{prepare.data} or a
    matrix with allele counts.}
}

\details{This function calculates an admixed individual's interspecific
heterozygosity (i.e. the proportion of the individual's genome with
alleles inherited from both parental populations) based on allele
counts. This function should only be used for co-dominant markers.  }

\value{ A numerical vector with an estimate of interspecific
heterozygosity for each individual.  }

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

## Estimate inter-specific heterozygosity
int.het<-calc.intersp.het(introgress.data=introgress.data)
}
}

