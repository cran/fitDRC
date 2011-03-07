\name{fitDRC-package}
\alias{fitDRC}
\docType{package}
\title{Fitting Density Ratio Classes}
\description{Constructs the smallest \emph{Density Ratio Class} for elicited probability-quantile points (or intervals) given a lower and upper distributional shape. Used optimisation algorithms are the methods \code{Nelder-Mead} and \code{L-BFGS-B} implemented in the standard R function \code{\link{optim}}. The package is easily customizable by using templates from the example section for distributions and transformations that are not implemented yet.}
\details{
\tabular{ll}{
Package: \tab fitDRC\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-03-03\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
The most important functions producing objects or results are:
\tabular{ll}{
(1) \code{dist.distributionfamily.create(...)}  \tab see for the class description \code{\link{distribution}}      \cr
(2) \code{trans.transformationkind.create(...)} \tab see for the class description \code{\link{transformation}}    \cr
(3) \code{dist.trans.create(...)}                      \tab see for the constructor description \code{\link{dist.trans.create}} \cr
(4) \code{process.elidat(...)}                         \tab see for the processing description \code{\link{process.elidat}}    \cr
}
(1) creates an object of the class \code{\link{distribution}} that is used to design lower
and upper distribution of the \emph{Density Ratio Class} whereby the implemented distributions are:
\tabular{ll}{
Normal    \tab \code{\link{dist.normal.create}}    \cr
Student   \tab \code{\link{dist.student.create}}   \cr
Weibull   \tab \code{\link{dist.weibull.create}}   \cr
Lognormal \tab \code{\link{dist.lognormal.create}} \cr
Beta      \tab \code{\link{dist.beta.create}}      \cr
Gamma     \tab \code{\link{dist.gamma.create}}     \cr
F         \tab \code{\link{dist.f.create}}         \cr
Uniform   \tab \code{\link{dist.uniform.create}}   \cr
Logistic  \tab \code{\link{dist.logistic.create}}  \cr
}
(2) creates an object of the class \code{\link{transformation}} that is used to
transform the distribution(s) with (3) (see \code{\link{dist.trans.create}}) returning again an object of
the class \code{\link{distribution}}. However, implemented transformations are:
\tabular{ll}{
Arctan      \tab \code{\link{trans.arctan.create}} \cr
Tan         \tab \code{\link{trans.tan.create}}    \cr
Log         \tab \code{\link{trans.log.create}}    \cr
Exponential \tab \code{\link{trans.exp.create}}    \cr
Dilation    \tab \code{\link{trans.dil.create}}    \cr
}
(4) processes the probability-quantile intervals/points in combination with the lower and upper distribution and returns
an object of the class \code{\link{drclass}} that is the \emph{Density Ratio Class} one wants to obtain (see \code{\link{process.elidat}}).
Several methods are implemented for each class described above. Use the templates from the example sections for the implementation of distributions and transformations that are not implemented yet.
}
\author{
Simon L. Rinderknecht and Peter Reichert.
}
\references{
S.L. Rinderknecht et al. Eliciting Density Ratio Classes, Int. J. Approx. Reason. (2011),\\
doi10.1016/j.ijar.2011.02.002
}
\keyword{Probability assessment}
\keyword{probability elicitation}
\keyword{expert elicitation}
\keyword{elicitation of vague knowledge}
\keyword{subjective probabilities}
\keyword{imprecise probabilities}
\keyword{decision theory}
\keyword{robust Bayesian statistics}
\keyword{quantile elicitation}
\keyword{Density Ratio Class}
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

dist.lower <- dist.trans.create(dist.beta,trans.dil)
dist.upper <- dist.lower

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
