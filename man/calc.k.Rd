\name{calc.k}
\alias{calc.k}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculating the ratio of normalising constants of the not necessarily normalised lower and upper probability density functions of a Density Ratio Class.
}
\description{
\code{calc.k} calculates \code{Kappa} which is the ratio of the normalising constants of the lower and upper probability density functions of a \emph{Density Ratio Class}. It can be interpreted as a measure of the size of a \emph{Density Ratio Class}. Hence \code{Kappa} is the target value that is minimized in the algorithm.}
\usage{calc.k(p, q, dist.lower, dist.upper, par.lower, par.upper)}
\arguments{
  \item{p}{Probabilities (in the corresponding order to the quantiles)}
  \item{q}{Quantiles (in the corresponding order to the probabilities)}
  \item{dist.lower}{Lower distribution of the \emph{Density Ratio Class} (see \code{\link{distribution}}).}
  \item{dist.upper}{Upper distribution of the \emph{Density Ratio Class} (see \code{\link{distribution}}).}
  \item{par.lower}{Distributional parameters of the lower distribution.}
  \item{par.upper}{Distributional parameters of the upper distribution.}
}
\details{
To calculate \code{Kappa} the density with heavier tails \emph{must} be the upper one. Otherwise the choice is \emph{not} compatible with the definition of the Density Ratio Class (see for an example below).}
\value{
\item{Kappa}{Kappa >=1 the minimally possible ratio of the not normalised probability density functions of a Density Ratio Class that is compatible with the chosen lower and upper distribution families and elicited probability-quantile points or intervals.}
\item{Lambda}{Lambda >=1 the minimally possible ratio of the not normalised probability density functions that is compatible with the chosen lower and upper distribution families only.}
}
\references{
Rinderknecht, S.L., Borsuk, M.E. and Reichert, P. Eliciting Density Ratio Classes. International Journal of Approximate Reasoning 52, 792-804, 2011. doi10.1016/j.ijar.2011.02.002. \\
Rinderknecht, S. L., Borsuk, M. E. and Reichert, P. Bridging Uncertain and Ambiguous Knowledge with Imprecise Probabilities, Environmental Modelling & Software 36, 122-130, 2012.
}
\author{
Simon L. Rinderknecht
}
\note{
For a better understanding what \code{Kappa} and \code{Lambda} are see also Eq. (4), (10), (11) and (12) in the referenced paper.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See also \code{\link{fitDRC}}.
}

\examples{
p <- c(0.05, 0.25, 0.5, 0.75, 0.95)
q <- qnorm(p)

dist.lower <- dist.normal.create(par=c(1,2))
dist.upper <- dist.normal.create(par=c(3,4))

par.lower <- dist.lower$par
par.upper <- dist.upper$par

#calc.k(p, q, dist.lower, dist.upper, c(0,1), c(0,1))       # perfect matching
                                                            # of elicited data 
                                                            # with chosen shapes
#calc.k(p, q, dist.lower, dist.upper, par.lower, par.upper) # general case
#calc.k(p, q, dist.lower, dist.upper,  c(0,50), c(0,1))     # not compatible
                                                            # with the def. of
                                                            # the DRC.


## The function is currently defined as
function (p, q, dist.lower, dist.upper, par.lower, par.upper) 
{
    x.min.lower <- CDFinv(dist.lower, 0.001, par.lower)
    x.max.lower <- CDFinv(dist.lower, 0.999, par.lower)
    x.min.upper <- CDFinv(dist.upper, 0.001, par.upper)
    x.max.upper <- CDFinv(dist.upper, 0.999, par.upper)
    x.min <- min(x.min.lower, x.min.upper)
    x.max <- max(x.max.lower, x.max.upper)
    x <- seq(x.min, x.max, length = 1e+06)
    Lambda <- max(PDF(dist.lower, x, par.lower)/PDF(dist.upper, 
                  x, par.upper))
    k1 <- (p * (1 - CDF(dist.lower, q, par.lower)))/(CDF(dist.upper, 
           q, par.upper) * (1 - p))
    k2 <- (CDF(dist.lower, q, par.lower) * (1 - p))/(p * (1 - 
           CDF(dist.upper, q, par.upper)))
    Kappa <- max(Lambda, k1, k2)
    return(list(Kappa = Kappa, Lambda = Lambda))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Ratio of normalising constants }
