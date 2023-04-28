\name{prepare.data}
\alias{prepare.data}
\title{Prepare Data}
\description{
This function is meant to be used with individuals from an admixed
population.  The function determines the number of alleles inherited
from each of two parental populations at each locus.  The counts are
based on genotype data from specified parental populations, which must
be supplied. This function works with both co-dominant and dominant (or
haploid) data.
}
\usage{
prepare.data(admix.gen=NULL, loci.data=NULL,
             parental1=NULL, parental2=NULL,
             pop.id=TRUE, ind.id=TRUE, fixed=FALSE,
             sep.rows=FALSE, sep.columns=FALSE)
}
\arguments{

  \item{admix.gen}{a matrix, array or data frame with genotype data}

  \item{loci.data}{a matrix or array providing marker information.}

  \item{parental1}{a matrix or two-dimensional array if
    \code{fixed=FALSE}, a single character if \code{fixed = TRUE}.}

  \item{parental2}{a matrix or two-dimensional array if
    \code{fixed=FALSE}, a single character if \code{fixed=TRUE}.}

  \item{pop.id}{a logical specifying whether \code{admix.gen} includes a
    row specifying sampling localities.}

  \item{ind.id}{a logical specifying whether \code{admix.gen} includes a
    row specifying individual identifications.}

  \item{fixed}{a logical specifying whether all loci scored exhibit
    fixed differences between the parental populations.}

  \item{sep.rows}{a logical specifying whether genotypes at a locus are
    recorded using two rows.}
  
  \item{sep.columns}{a logical specifying whether genotypes at a locus are
  recorded using two columns.}

}

\details{

  Genotypic data for individuals are provided in \code{admix.gen}, a
data object with genotypes for each individual at each locus in the
format `A/D' or `110/114' for co-dominant data, `A' or `hap1b' for
haploid data, and `0' or `1' for dominant data.  In other words, for
co-dominant and haploid data alleles can be encoded by any simple
character string.  Each row should contain data for a locus and columns
should correspond to individuals. Missing data should be entered as
`NA/NA' or `NA' for co-dominant and haploid / dominant data,
respectively.

Alternatively, in \code{admix.gen} genotypic data for an
individual can be split between two rows (\code{sep.rows = TRUE}) or two
columns (\code{sep.columns = TRUE}).  These options are similar to those
of the data format for the program \emph{structure} (Pritchard et
al. 2000, Falush et al. 2003), with the difference
that \code{admix.gen} is transposed relative to the input for
\emph{structure}. Thus, after reading in a \emph{structure} file, the
data matrix can be transposed with \code{rawdata <- t(rawdata)} before
passing the matrix to \code{prepare.data}.  If genotype data are split
across columns or rows, and they include haploid or dominant markers,
the second allele for these markers should be recorded as \code{NA}.

If \code{pop.id = TRUE} and \code{ind.id = TRUE} the first row of
\code{admix.gen} should give the population identification
(i.e. sampling locality) of each individual and the second row should
provide a unique individual identification; genotype information would
then begin on row three.

\code{loci.data} is a matrix or array data object where each row
provides information on one locus. The first column gives a unique locus
name (e.g. \emph{"locus3"}), and the second column specifies whether the
locus is co-dominant (\emph{"C"} or \emph{"c"}), haploid (\emph{"H"} or
\emph{"h"}), or dominant (\emph{"D"} or \emph{"d"}). These first two
columns in \code{loci.data} are required. The third column, which is
optional, is a numeric value specifying the linkage groups for the
marker. If present, this column is used in the \code{mk.image} function
for plotting.  The fourth column, which is also optional, is a numeric
value specifying both the linkage group and location on the linkage
group (e.g. \emph{3.70}, for a marker at 70 cM on linkage group 3). This
last column could be used to generate a different order in which to
utilize marker data from \code{admix.gen} in other functions in the package
(specified in the \code{marker.order} argument to \code{mk.image} and
\code{clines.plot}).  Each column in \code{loci.data} should have a
heading (the second column should be named "type").

If the parental populations exhibit fixed differences for all markers
scored (i.e. \code{fixed = TRUE}) then \code{parental1} and
\code{parental2} should give the character used to specify alleles
derived from parental populations one and two, respectively
(e.g. \code{parental1 = "p1"} and \code{parental2 = "p2"}). If parental
populations exhibit fixed differences at all loci, the count matrix
produced by \code{prepare.data} is simply a count of the number of
alleles inherited from parental population 1 for each individual at each
locus (0, 1, or 2 for co-dominant marker data; 0 or 1 for dominant or
haploid marker data).

If the parental populations do not exhibit fixed differences at all loci
scored (i.e. \code{fixed = FALSE}) then \code{parental1} and
\code{parental2} should be matrix data objects providing genotype data
for individuals sampled from each of the parental populations. These
data objects should be in the same format as the \code{genotype.data}
data object, with the difference that they should not contain rows for
individual and population identifications at the top.
\code{prepare.data} uses the parental data objects to calculate allele
frequencies at each locus for both of the parental populations. Alleles
are then binned into allelic classes with maximum (equal to the
observed) frequency differentials between parental populations
(\eqn{\delta}, Gregorius and Roberds 1986). These allelic classes serve
as the basis for estimating the count matrix, which is in the same
format as described above. In the absence of fixed differences the
counts are of alleles from the allelic class associated with population
1 and the frequency of allelic classes in the parental species can be
used to account for uncertainty in the ancestry of particular alleles.

See Gompert and Buerkle (2009a, 2009b) for additional details.
}

\value{
A list with the following components:

\item{Individual.data}{a matrix with \code{pop.id} and \code{ind.id}
  data if they were supplied.}

\item{Count.matrix}{the count matrix; each row corresponds to a locus
  and each column represents an individual.}

\item{Combos.to.use}{\code{NULL} if \code{fixed = TRUE}, otherwise this
  provides the allelic class data needed for \code{genomic.clines}.}

\item{Parental1.allele.freq}{matrix of allele frequencies calculated for
  parental population 1 where each row
  is a locus and each column is an allele.}

\item{Parental2.allele.freq}{matrix of allele frequencies calculated for
  parental population 2 where each row
  is a locus and each column is an allele.}

\item{Alleles}{a matrix specifying the names of the alleles in the same
  order as they are given in \code{Parental1.allele.freq} and
  \code{Parental2.allele.freq} for each locus.}

\item{Admix.gen}{the matrix of genotype data for the admixed population;
  each row corresponds to a locus and each column represents an individual.}
}

\references{

  Falush D., Stephens M., and Pritchard J. K. (2003) Inference of population
  structure using multilocus genotype data: linked loci and correlated
  allele frequencies. Genetics, \bold{164}, 1567-1587.
  
  Gompert Z. and Buerkle C. A. (2009) A powerful regression-based
  method for admixture mapping of isolation across the genome of
  hybrids. \emph{Molecular Ecology}, \bold{18}, 1207-1224.

  Gompert Z. and Buerkle C. A. (2009) \emph{introgress}: a software
  package for mapping components of isolation in
  hybrids. \emph{Molecular Ecology Resources}, \emph{in preparation}.

  Gregorius H. R. and Roberds J. H. (1986) Measurement of genetical
  differentiation among subpopulations. \emph{Theoretical and Applied
    Genetics}, \bold{71}, 826-834.

  Pritchard J. K., Stephens M., and Donnelly P. (2000) Inference of population
  structure using  multilocus genotype data. Genetics, \bold{155}, 945-959.

 } 

\author{
Zachariah Gompert \email{zgompert@uwyo.edu}, C. Alex Buerkle \email{buerkle@uwyo.edu}
}  

\seealso{
\code{\link{delta}}, \code{\link{mk.image}}, \code{\link{genomic.clines}}, \code{\link{clines.plot}}
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

}
}
