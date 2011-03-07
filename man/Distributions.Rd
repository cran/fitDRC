\name{Distributions}
\alias{distribution}
\alias{dist.normal.create}
\alias{dist.student.create}
\alias{dist.weibull.create}
\alias{dist.lognormal.create}
\alias{dist.beta.create}
\alias{dist.gamma.create}
\alias{dist.f.create}
\alias{dist.uniform.create}
\alias{dist.logistic.create}

\alias{print.distribution}
\alias{summary.distribution}
\alias{plot.distribution}

\alias{PDF.distribution}
\alias{CDF.distribution}
\alias{CDFinv.distribution}
\alias{RANGE.distribution}
\alias{MEAN.distribution}
\alias{SD.distribution}
\alias{MEDIAN.distribution}
\alias{MODE.distribution}

\title{The class `distribution' in the fitDRC-package: its constructors and methods.}
\description{
Lower and upper distributions of the \emph{Density Ratio Class} must be in the form of an object of the class \code{distribution} such as described in this sheet. Objects of the class \code{distribution} can be used in a second step in function \code{\link{process.elidat}} that finally yields the smallest \emph{Density Ratio Class} given the the probability-quantile intervals/poins. The described functions below create \code{distribution} objects for wich some methods are implemented too. The distributional parameter(s) (at least one) that finally shall be optimized for the smallest \emph{Density Ratio Class} must be specified with name. For transformed distributions see \code{\link{transformation}} and \code{\link{dist.trans.create}}.
}
\usage{
dist.normal.create(par = NA)
dist.student.create(par = NA)
dist.weibull.create(par = NA)
dist.lognormal.create(par = NA)
dist.beta.create(par = NA)
dist.gamma.create(par = NA)
dist.f.create(par = NA)
dist.uniform.create(par= NA)
dist.logistic.create(par = NA)

\method{print}{distribution}(x = dist,...)
\method{summary}{distribution}(object = dist,...)
\method{plot}{distribution}(x = dist, par = dist$par, range = NA, what = "PDF", plot = TRUE, length = 101, ...)
\method{PDF}{distribution}(dist, x, par = dist$par, log = FALSE,...)
\method{CDF}{distribution}(dist, x, par = dist$par,...)
\method{CDFinv}{distribution}(dist, p, par = dist$par,...)
\method{RANGE}{distribution}(dist, par = dist$par,...)
\method{MEAN}{distribution}(dist, par = dist$par, ...)
\method{SD}{distribution}(dist, par = dist$par, ...)
\method{MEDIAN}{distribution}(dist, par = dist$par, ...)
\method{MODE}{distribution}(dist, par = dist$par, ...)
}
\arguments{
  \item{par}{vector of the parameters of the distribution, if not named in the implemented order as shown in the list below for each implemented distribution. At least one parameter value has to be specified. Unspecified parameter values will take the default values (see list below).
\tabular{ll}{
   normal:    \tab\code{ par = c("Mean" = 0,"StDev" = 1)                }\cr
   student:   \tab\code{ par = c("Mean" = 0, "StDev" = 1, "DF" = 3)     }\cr
   weibull:   \tab\code{ par = c("Shape" = 2, "Scale" = 2 )             }\cr
   lognormal: \tab\code{ par = c("Mean" = 1, "StDev" = 1)               }\cr
   beta:      \tab\code{ par = c("Shape1" = 1,"Shape2" = 1)             }\cr
   gamma:     \tab\code{ par = c("shape" = 1,"rate" = 1)                }\cr
   f:         \tab\code{ par = c("df1" = 3, "df2" = 5, "ncp" = 0)       }\cr
   uniform:   \tab\code{ par = c("Min" = 0,"Max" = 1)                   }\cr
   logistic:  \tab\code{ par = c("Location" = 0,"Scale" = 1)            }\cr
   }
}
  \item{dist}{object of class \code{distribution}.}
  \item{x}{in dependence of the function either an object of the class \code{distribution} or the location of where to evaluate the distribution.}
  \item{object}{object of the class \code{distribution}.}
  \item{p}{probability of where the inverse distribution has to be evaluated.}
  \item{range}{used in the method \code{plot}: specifies the plot range}
  \item{what}{determines what to plot or calculate, can be set to: \code{PDF}, \code{CDF} or \code{CDFinv}.}
  \item{plot}{argument used in the method \code{plot}: creates a plot if set to TRUE, returns a matrix with x an y column if set to FALSE.}
  \item{length}{plot resolution.}
  \item{log}{if TRUE the logarithm of the PDF is returned, default is FALSE.}
  \item{...}{further arguments that can be passed to a function.}
}
\details{
Implement your own distribution using the template from the example section below if the distribution you are looking for is not implemented.
}
\value{
  \item{name}{the name of the distribution}
  \item{range}{the range of the distribution}
  \item{par.names}{the names of the parameters of the distribution}
  \item{par.ranges}{the ranges of the parameters of the distribution}
  \item{par}{the values of the parameters of the distribution}
  \item{mean}{a function to calculate the mean of the distribution}
  \item{sd}{a function to calculate the standard deviation of the distribution}
  \item{median}{a function to calculate the median of the normal distribution}
  \item{mode}{a function to calculate the mode of the distribution (does not exist for e.g. the Uniform distribution)}
  \item{pdf}{a function to calculate the pdf (probability density function) of the distribution}
  \item{cdf}{a function to calculate cdf (cumulative distribution function) of the distribution}
  \item{cdf.inv}{a function to calculate the inverse cdf of the distribution}
}

\references{S.L. Rinderknecht et al. Eliciting Density Ratio Classes, Int. J. Approx. Reason (2011),
doi10.1016/j.ijar.2011.02.002}

\author{Simon L. Rinderknecht}
%%\note{~~further notes~~}

\seealso{
See also \code{\link{fitDRC}} for general information and \code{\link{transformation}}, \code{\link{dist.trans.create}} for transformed distributions.
}

\examples{
print(dist.normal.create(c(Mean = 0, StDev = 1)))
print(dist.student.create(c(DF=99)))
dist.weibull.create(c(Shape=2,Scale=99))
summary(dist.lognormal.create(c(StDev=2)))

plot(dist.beta.create(c(2,1)),plot=FALSE)
plot(dist.gamma.create(c(2,1)),main="myGamma",xlab="x",ylab="pdf")
plot(dist.f.create(c(ncp=99)),main="F",what="CDF",xlab="x",ylab="cdf")
plot(dist.uniform.create(c(-1,1)),main="Uniform",what="CDFinv",xlab="p",ylab="inv-cdf")
plot(dist.logistic.create(c(2,1)),par=c(Scale=5))

dist.normal <- dist.normal.create(c(StDev=2))
is(dist.normal)                       # element of class distribution
plot(dist.normal,par=c(StDev=3))
dist.normal$par <- c(2,2)             # "permanent" parameter change
plot(dist.normal)
plot(dist.normal, par = c(Mean = 0))  # "temporary" parameter change

# Default setting of the parameters:

dist.normal.create(par = c(Mean = 0, StDev = 1))
dist.student.create(par = c("Mean" = 0, "StDev" = 1, "DF" = 3))
dist.weibull.create(par = c( "Shape" = 2, "Scale" = 2 ))
dist.lognormal.create(par = c("Mean" = 1, "StDev" = 1))
dist.beta.create(par = c("Shape1" = 1, "Shape2" = 1))
dist.gamma.create(par = c("shape" = 1, "rate" = 1))
dist.f.create(par = c("df1" = 3,"df2" = 5, "ncp" = 0))
dist.uniform.create(par= c("Min" = 0, "Max" = 1))
dist.logistic.create(par = c("Location" = 0,"Scale" = 1))



##############################################################################
       ### if you want to create your own distribution read this ###
##############################################################################

# use the template below and replace the code in between *<* ... *>*
# accordingly. Do not forget to delete the *<* and *>* that are only used to
# indicate the custom fields.
# type 'dist.normal.create' to see an already implemented distribution.

##############################################################################
### if you want to create your own distribution use the following template ###
##############################################################################

# dist.*<*YourDistributionFamilyName*>*.create <- function(par=NA)
# {
#   # set default parameter values:
#   par.default <- c(*<*YourFirstParamterDefaulValue, ...*>*)
#   names(par.default) <- c( *<*"YourParameterNameOfYourFirstParamter", "..."*>* )
#   p <- mergePar(par,par.default)
#   # construct class:
#   dist            <- list()
#   dist$name       <- "*<*YourDistributionName*>*"
#   dist$range      <- function(par) # range of the distribution
#                      {
#                         return(c(*<*YourLowerRange,YourUperRange*>*))
#                     }
#   dist$par.names  <- names(p)
#   dist$par.ranges <- matrix(
#                             c(*<*-NA, +NA,*>*      # ranges of par01
#                               *<*-NA, +NA*>*),     # ...
#                               byrow=TRUE,ncol=2)
#   dist$par        <- p
#   dist$mean       <- function(par)
#                      {
#                         mean <- *<*MeanFormula(par)*>*
#   	                  names(mean) <- "Mean"
#   	                  return(mean)
#   	                  }
#   dist$sd         <- function(par) 
#                      {
#                      	 sd <- *<*StandardDevFormula(par)*>* 
#                        names(sd) <- "StDev"
#                        return(sd)
#                      }
#   dist$median     <- function(par)
#                      { 
#                        median <- *<*MedianFormula(par)*>*
#                      	 names(median) <- "Median"
#                      	 return(median)
#                      }
#   dist$mode       <- function(par)
#                     { 
#                      	 mode <- *<*ModeFormula(par)*>*
#                        names(mode) <- "Mode"
#                        return(mode)
#                      }
#   dist$pdf        <- function(x,par) { return( *<*dyourdist(x, par)*>* ) }
#   dist$cdf        <- function(x,par) { return( *<*pyourdist(x, par)*>* ) }
#   dist$cdf.inv    <- function(p,par) { return( *<*qyourdist(p, par)*>* ) }
#   class(dist)     <- "distribution"
#   return(dist)
#}

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}