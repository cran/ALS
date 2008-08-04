\name{multiex}
\alias{multiex}
\alias{d1}
\alias{d2}
\alias{Cstart1}
\alias{Cstart2}
\alias{S}
\alias{x}
\alias{x2}
\docType{data}
\title{Data inspired by GC mass spectrometry experiments}
\description{Data inspired by GC mass spectrometry experiments.}
\usage{
data("multiex")
}
\format{
  \code{d1} and \code{d2} are matrices of dimension
  80 by 400 representing time and m/z resolved data.

  \code{x} and \code{x2} represent the 80 times and 400 m/z values represented
  by the data, respectively. 

  \code{Cstart1} and \code{Cstart2} are matrices of dimension
  80 by 2, representing starting values for elution profiles.
  
  \code{S} represents mass spectra known to be represented in the data,
  as a 400 by 2 matrix. 
}
\examples{
data("multiex")
## mass spectra in the data 
plotS(S,x2)

## starting values for elution profiles
matplot(x,Cstart1,type="l")
matplot(x,Cstart2,type="l",add=TRUE)
}

\keyword{datasets}
