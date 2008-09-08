\name{multiex1}
\alias{multiex1}
\alias{PsiList}
\alias{AList}
\alias{xm}
\alias{xm2}
\alias{Sm}
\alias{C1}
\alias{WList}
\docType{data}
\title{Data inspired by GC mass spectrometry experiments}
\description{Data inspired by GC mass spectrometry experiments.}
\usage{
data("multiex1")
}
\format{
  \code{PsiList} is a list of 15 matrices of dimension 81 by 165, each
  representing time and m/z resolved data.

  \code{WList} is a list of 15 matrices of dimension 81 by 165, in which
  each point is a weight to be applied to a given data point.
   
  \code{xm} and \code{xm2} represent the 81 times and 165 m/z values
  represented by each dataset in \code{PsiList}, respectively. 

  \code{AList} is a list of length 15, the elements of which represent
  estimates for the amplitude of each component in each of the 15
  datasets.

  \code{C1} is a 81 by 2 matrix representing a starting value for the
  shape of the elution profiles.
     
  \code{Sm} represents mass spectra known to be represented in the data,
  as a 165 by 2 matrix. 

}
\seealso{\code{\link{als}} }
\examples{
data("multiex1")
## mass spectra in the data 
plotS(Sm,xm2)
}

\keyword{datasets}
