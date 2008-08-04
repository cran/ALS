\name{plotS}
\alias{plotS}
\title{Plots a matrix representing mass spectra}
\description{For each column in a matrix representing mass spectra,
  generates a sub-plot}
\usage{
plotS(S, x2, out="", filename=paste("S.", out, sep = ""),
col=vector(),cex=1, lab="",cex.lab=1)
}
\arguments{
  \item{S}{matrix representing mass spectra of dimension \code{n} by
    \code{comp} where \code{comp} is the number of spectra}
  \item{x2}{vector of masses that label the rows of \code{S}}
  \item{out}{if \code{""}, the plot is written to the current device; if
  "ps" a postscript file is written and if \code{"pdf"} then a pdf file
is written}
  \item{filename}{character vector specifying the name of the file to write
    if \code{out=TRUE}}
  \item{col}{if length is greater than zero, then the color to plot each
    spectrum}
  \item{cex}{\code{cex}  A numerical value giving the amount by which
          plotting text and symbols should be magnified relative to the
          default.}
	\item{lab}{\code{cex.lab}  A character vector used as y-axis label.}
	\item{cex.lab}{\code{cex.lab}  A numerical value giving
	  magnification to be used for x and y labels relative
          to the default.}}
\examples{
## load example mass spectra S and vector of m/z values x2
data(multiex)

plotS(S,x2)

}
\author{Katharine M. Mullen}
\seealso{\code{\link{als}} }
\keyword{hplot}
