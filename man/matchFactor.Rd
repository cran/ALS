\name{matchFactor}
\alias{matchFactor}
\title{Matching factor functions to describe similarity of two vectors}
\description{Matching factor functions to describe similarity of two
  vectors.  This function may be useful to match an estimated mass
  spectrum against mass spectra of known compounds, in order to identify
  the compound represented by the estimated mass spectrum.}
\usage{
matchFactor(u, s, type="dot")
}
\arguments{
  \item{u}{numeric vector of length \code{n}}
  \item{s}{numeric vector of length \code{n}}
  \item{type}{character vector describing the matching factor function
    to apply; the choices are \code{"dot"} for the normalized dot
    product or \code{"euclid"} for the normalized
  euclidean distance.} 
}
\value{numeric between 0 and 1 representing the matching factor; vectors
  that are more similar have a larger matching factor.  Note that if both
\code{u} and \code{s} are all zero, we let the matching factor be 1; if one and
only one of \code{u} and \code{s} are all zero, we let the matching
factor be 0.  }
\references{ 
Alfassi ZB. On the normalization of a mass spectrum for comparison
of two spectra. Journal of the American Society for Mass Spectrometry
2004; 15:385-387.
  
Stein SE, Scott DR. Optimization and testing of mass spectral library
search algorithms for compound identication. Journal of the American
Society for Mass Spectrometry 1994; 5:859-866.
}
\author{Katharine M. Mullen}
\seealso{\code{\link{als}} }
\keyword{hplot}
