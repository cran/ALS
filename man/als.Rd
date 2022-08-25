\name{als}
\alias{als}
\title{alternating least squares multivariate curve resolution (MCR-ALS)}
\description{This is an implementation of alternating least squares
  multivariate curve resolution (MCR-ALS).  Given a dataset in matrix
  form \code{d1}, the dataset is decomposed as \code{d1=C \%*\% t(S)}
  where the columns of \code{C} and \code{S} represent components
  contributing to the data in each of the 2-ways that the matrix is
  resolved.  In forming the decomposition, the components in each way
  many be constrained with e.g., non-negativity, uni-modality,
  selectivity, normalization of \code{S} and closure of \code{C}.  Note
  that if more than one dataset is to be analyzed simultaneously, then
  the matrix \code{S} is assumed to be the same for every dataset in the
  bilinear decomposition of each dataset into matrices \code{C} and
  \code{S}.
 
}
\usage{
als(CList, PsiList, S=matrix(), WList=list(),
thresh =.001, maxiter=100, forcemaxiter = FALSE,
optS1st=TRUE, x=1:nrow(CList[[1]]), x2=1:nrow(S),
baseline=FALSE, fixed=vector("list", length(PsiList)),
uniC=FALSE, uniS=FALSE, nonnegC = TRUE, nonnegS = TRUE,
normS=0, closureC=list())
}
\arguments{
  \item{CList}{list with the same length as \code{PsiList} where each
    element is a matrix of dimension \code{m} by \code{comp} and
    represents the matrix \code{C} for each dataset }
  \item{PsiList}{list of datasets, where each dataset is a matrix of dimension
    \code{m} by \code{n} }
  \item{S}{matrix with \code{n} rows and \code{comp} columns,
    often representing (mass) spectra}
  \item{WList}{An optional list with the same length as \code{PsiList},
    where each element is a matrix of dimension \code{m} by \code{n} giving
    the weight of that datapoint; note that if closure or normalization
  constraints are applied, then both are applied after the application
  of weights. }
  \item{thresh}{numeric value that defaults to .001; if
    \code{((oldrss - rss) / oldrss) < thresh} then the optimization stops,
    where \code{oldrss} is the residual sum of squares at iteration
    \code{x-1} and \code{rss} is the residual sum of squares at iteration
    \code{x} }
  \item{maxiter}{The maximum number of iterations to perform (where an
    iteration is optimization of either \code{AList} and \code{C})}
   \item{forcemaxiter}{Logical indicating whether \code{maxiter}
     iterations should be performed even if the residual difference
     drops below \code{thresh}.}
  \item{optS1st}{logical indicating whether the first constrained least
    squares regression should estimate \code{S} or \code{CList}.}
  \item{x}{optional vector of labels for the rows of \code{C}, which are
    used in the application of unimodality constraints.  }
  \item{x2}{optional vector of labels for the rows of \code{S}, which are
    used in the application of unimodality constraints.  }
  \item{baseline}{logical indicating whether a baseline component is
    present; if \code{baseline=TRUE} then this component is exempt from 
    constraints unimodality or non-negativity}
  \item{fixed}{
    list with the same length as \code{PsiList} in which each
    element is a vector of the indices of the components to fix to zero
    in each dataset}    
  \item{nonnegS}{logical indicating whether the components (columns) of
    the matrix \code{S} should be constrained to non-negative values}
  \item{nonnegC}{logical indicating whether the components (columns) of
    the matrix \code{C} should be constrained to non-negative values}
  \item{uniC}{logical indicating whether unimodality constraints should be
    applied to the columns of \code{C}}
  \item{uniS}{logical indicating whether unimodality constraints should be
    applied to the columns of \code{S}}
  \item{normS}{numeric indicating whether the spectra are normalized; if
    \code{normS>0}, the spectra are normalized.  If \code{normS==1} the
    maximum of the spectrum of each component is constrained to be equal
    to one; if \code{normS > 0 && normS!=1} then the norm of the
    spectrum of each component is constrained to be equal to one.  
    }
  \item{closureC}{list; if the length is zero, then
  no closure constraints are applied.  If the length is not zero, it
  should be equal to the number of datasets in the analysis, and contain
  numeric vectors consisting of the desired value of
  the sum of each row of the concentration matrix.
}
}
\value{
   A list with components:
   \item{CList}{A list with the same length as the number of datasets,
     containing the optimized matrix \code{C} at termination scaled by
     the optimized amplitudes for that dataset from \code{AList}.}
   \item{S}{The matrix \code{S} given as input. }
   \item{rss}{The residual sum of squares at termination.}
   \item{resid}{A list with the same length as the number of datasets,
     containing the residual matrix for each dataset}
   \item{iter}{The number of iterations performed before termination. }
 }
\examples{
## load 2 matrix datasets into variables d1 and d2
## load starting values for elution profiles
## into variables Cstart1 and Cstart2
## load time labels as x, m/z values as x2
data(multiex)

## starting values for elution profiles
matplot(x,Cstart1,type="l")
matplot(x,Cstart2,type="l",add=TRUE)

## using MCR-ALS, improve estimates for mass spectra S and the two
## matrices of elution profiles
## apply unimodality constraints to the elution profile estimates
## note that the starting estimates for S just contain a dummy matrix

test0 <- als(CList=list(Cstart1,Cstart2),S=matrix(1,nrow=400,ncol=2),
PsiList=list(d1,d2), x=x, x2=x2, uniC=TRUE, normS=0)

## plot the estimated mass spectra 
plotS(test0$S,x2)

## the known mass spectra are contained in the variable S
## can compare the matching factor of each estimated spectrum to
## that in S
matchFactor(S[,1],test0$S[,1])
matchFactor(S[,2],test0$S[,2])
 
## plot the estimated elution profiles
## this shows the relative abundance of the 2nd component is low 
matplot(x,test0$CList[[1]],type="l")
matplot(x,test0$CList[[2]],type="l",add=TRUE)
}
\references{
Garrido M, Rius FX, Larrechi MS. Multivariate curve resolution
alternating least squares (MCR-ALS) applied to spectroscopic data from
monitoring chemical reactions processes. Journal Analytical and
Bioanalytical Chemistry 2008; 390:2059-2066.

Jonsson P, Johansson A, Gullberg J, Trygg J, A J, Grung B, Marklund S,
Sjostrom M, Antti H, Moritz T. High-throughput data analysis for
detecting and identifying differences between samples in GC/MS-based
metabolomic analyses. Analytical Chemistry 2005; 77:5635-5642.

Tauler R. Multivariate curve resolution applied to second order data.
Chemometrics and Intelligent Laboratory Systems 1995; 30:133-146.

Tauler R, Smilde A, Kowalski B. Selectivity, local rank, three-way data
analysis and ambiguity in multivariate curve resolution. Journal of
Chemometrics 1995; 9:31-58.
}
\note{This function was used to solve problems described in

  van Stokkum IHM, Mullen KM, Mihaleva VV.  Global analysis of multiple
  gas chromatography-mass spectrometry (GS/MS) data sets: A method for
  resolution of co-eluting components with comparison to MCR-ALS.
  Chemometrics and Intelligent Laboratory Systems 2009; 95(2): 150-163.

in conjunction with the package TIMP.  For the code to reproduce
the examples in this paper, see examples_chemo.zip included in the
\code{inst} directory of the package source code. .
}
\seealso{\code{\link{matchFactor}},\code{\link{multiex}},\code{\link{multiex1}},
  \code{\link{plotS}}}
\keyword{optimize}
