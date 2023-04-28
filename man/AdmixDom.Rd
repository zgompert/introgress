\name{AdmixDom}
\docType{data}
\alias{AdmixDom}
\title{Admixed Population Dominant Genotype Data from Simulation 1}
\description{
This data set contains genotypes for a simulated admixed
population. The simulated admixed populations conisted of 500 diploid
hermaphroditic individuals with ten pairs of chromosomes, each one
Morgan in length. The admixed population resulted from an intitial
hybridization event between two parental populations (combined in equal
proportions) and mating within the admixed population continued for five
additional generations. Fitness of hybrids was determined based on a
marker at the center of chromosome 1; individuals homozygous at this
location had a fitness of 1, while heterozygotes had of fitness of
0.1. Two hundred admixed individuals were sampled at the completion of
the simulation and scored for 110 dominant markers spaced evenly
across all 10 linkage groups (at 10 cM intervals). Alleles inherited
from parental population 1 were treated as the dominant alleles.

The data are provided as a matrix with rows and columns corresponding to
markers and individuals, respectively. For each marker an individuals
genotype is given by a 1 (homozygous for population 1 alleles or
heterozygous) or 0 (homozygous for population 2 alleles).

}
\usage{data(AdmixDom)}
\format{A matrix with 110 rows and 200 columns.}
\source{From simulations conducted by CAB and ZG.}
\references{
Gompert Z. and Buerkle C. A. (2009) A powerful regression-based
method for admixture mapping of isolation across the genome of
hybrids. \emph{Molecular Ecology}, \bold{18}, 1207-1224.

Gompert Z. and Buerkle C. A. (2009) \emph{introgress}: a software
package for mapping components of isolation in hybrids. \emph{Molecular
  Ecology Resources}, \emph{in preparation}.  
} 

\seealso{
\code{\link{LociD}}
}

\keyword{datasets}

