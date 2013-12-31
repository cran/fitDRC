\name{process.elidat}
\alias{process.elidat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Process the elicited data to an optimised \emph{Density Ratio Class}}
\description{
Constructs the smallest \emph{Density Ratio Class} for elicited probability-quantile points (or intervals) given a lower and upper distributional shape. Used optimisation algorithms are the methods \code{Nelder-Mead} and \code{L-BFGS-B} implemented in the standard R function \code{\link{optim}}.}
\usage{
process.elidat(p = p, q = q, dist.lower, dist.upper, 
               start.dist.lower.par = NA, start.dist.upper.par = NA, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p}{
Vector of probabilities in the according order to \code{q}.}
  \item{q}{
Vector of quantiles in the according order to \code{p}.}
  \item{dist.lower}{
Lower distribution as an element of the class \code{\link{distribution}}.
}
  \item{dist.upper}{
Upper distribution as an element of the class \code{\link{distribution}}.
}
  \item{start.dist.lower.par}{
Start values of the parameters of the lower distribution that shall be optimized.
}
  \item{start.dist.upper.par}{
Start values of the parameters of the upper distribution that shall be optimized.
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
Only the specified start values of the lower and upper distribution are optimised. If no optimisation shall be executed (fixed parameters of the distributions) then use \code{\link{calc.k}}.}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{drclass}{an object of the class \code{\link{drclass}}.}
%%  \item{comp2 }{Description of 'comp2'}
}
\references{
Rinderknecht, S.L., Borsuk, M.E. and Reichert, P. Eliciting Density Ratio Classes. International Journal of Approximate Reasoning 52, 792-804, 2011. doi10.1016/j.ijar.2011.02.002. \\
Rinderknecht, S. L., Borsuk, M. E. and Reichert, P. Bridging Uncertain and Ambiguous Knowledge with Imprecise Probabilities, Environmental Modelling & Software 36, 122-130, 2012.
}

\author{Simon L. Rinderknecht}

%%\note{
%%  ~~further notes~~
%%}

\seealso{
See also \code{\link{fitDRC}}, \code{\link{distribution}}, \code{\link{transformation}}, \code{\link{dist.trans.create}}.
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
