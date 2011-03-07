\name{process.elidat}
\alias{process.elidat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Process the elicited data to an optimised \emph{Density Ratio Class}}
\description{
Constructs the smallest \emph{Density Ratio Class} for elicited probability-quantile points (or intervals) given a lower and upper distributional shape. Used optimisation algorithms are the methods \code{Nelder-Mead} and \code{L-BFGS-B} implemented in the standard R function \code{\link{optim}}.}
\usage{
process.elidat(p = p, q = q, dist.lower, dist.upper, start.dist.lower.par = NA, start.dist.upper.par = NA, ...)
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
\references{S.L. Rinderknecht et al. Eliciting Density Ratio Classes, Int. J. Approx. Reason (2011),
doi10.1016/j.ijar.2011.02.002}

\author{Simon L. Rinderknecht}

%%\note{
%%  ~~further notes~~
%%}

\seealso{
See also \code{\link{fitDRC}}, \code{\link{distribution}}, \code{\link{transformation}}, \code{\link{dist.trans.create}}.
}

\examples{
################# Exp 01 ################

p <- c(0.05, 0.25, 0.5, 0.75, 0.95)
q <- qnorm(p)

dist.lower <- dist.normal.create(par=c(1,2))
dist.upper <- dist.normal.create(par=c(3,4))

## Attention runtime approx. 5 minutes ##
# res <- process.elidat(p = p,
#                       q = q,
#                       dist.lower,
#                       dist.upper,
#                       start.dist.lower.par = c("Mean"=2,"StDev"=3),
#                       start.dist.upper.par = c("Mean"=4,"StDev"=5))
# drc01 <- res$drc
# drc01
# plot(drc01)

################# Exp 02 ################

p <- c(0.05, 0.25, 0.5, 0.75, 0.95)
q <- c(80, 145, 200, 240, 280)

dist.beta  <- dist.beta.create(par=c(2.5,2.5))
trans.dil <- trans.dil.create(c(60, 305, 0, 1))
dist.lower <-dist.trans.create(dist.beta,trans.dil)

trans.dil <- trans.dil.create(c(60, 305, 0, 1))
dist.upper <-dist.trans.create(dist.beta,trans.dil)

## Attention runtime approx. 5 minutes ##
# res <- process.elidat(p = p,
#                       q = q,
#                       dist.lower,
#                       dist.upper,
#                       start.dist.lower.par =c("Shape1"=2.5,"Shape2"=2.5),
#                       start.dist.upper.par = c("Shape1"=2.5,"Shape2"=2.5))
# drc02 <- res$drc
# drc02
# plot(drc02)

################# Exp 03 ################

p <- c(0.05, 0.25, 0.5, 0.75, 0.95, 0.05, 0.25, 0.5, 0.75, 0.95)
q <- log(c(1, 2, 4, 6, 10, 2, 3, 5, 9, 14))

dist.lower  <- dist.normal.create(par=c(1,1))
dist.upper <- dist.student.create(par=c(1,1,3))

## Attention runtime approx. 5 minutes ##
# res <- process.elidat(p = p,
#                       q = q,
#                       dist.lower,
#                       dist.upper,
#                       start.dist.lower.par = c("Mean"=1,"StDev"=1),
#                       start.dist.upper.par = c("Mean"=1,"StDev"=1))
# drc03 <- res$drc
# drc03
# plot( drc03, range = c(0.001,15))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
