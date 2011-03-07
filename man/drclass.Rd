\name{drclass}
\alias{drclass}
\alias{drclass.create}
\alias{print.drclass}
\alias{summary.drclass}
\alias{plot.drclass}
\alias{Kappa.drclass}
\alias{Lambda.drclass}
\alias{metrics.drclass}
\alias{metric.ci.drclass}
\alias{metric.width.drclass}
\alias{metric.shape.drclass}
\alias{metric.mode.drclass}

\title{The class 'drclass' in the fitDRC-package: its constructors and methods.}
\description{
An object of the class \code{drclass} defines a \emph{Density Ratio Class} and has a structure of a list containing \code{name}, \code{range}, \code{p}, \code{q},  \code{dist.lower},  \code{dist.upper}. Methods for density ratio class such as \code{metrics} calculates the relative (to a credible interval \code{1-alpha}) ambiguity of important attributes such as width, shape and mode. See the referenced literature for further information.
}
\usage{
drclass.create(p = c(0.05,0.25,0.5,0.75,0.95),
               q = qnorm(c(0.05,0.25,0.5,0.75,0.95)),
               dist.lower = dist.normal.create(c(0,1)),
               dist.upper = dist.normal.create(c(0,1)))

\method{print}{drclass}(x  = drc, ...)
\method{summary}{drclass}(object = drc, alpha = 0.05, ...)
\method{plot}{drclass}(x = drc, range = NA, plot.stat.values = FALSE, makePDF = FALSE, ...)

\method{Kappa}{drclass}(drc, ...)
\method{Lambda}{drclass}(drc, ...)

\method{metrics}{drclass}(drc, alpha = 0.05, ...)
\method{metric.ci}{drclass}(drc, alpha = 0.05, ...)
\method{metric.width}{drclass}(drc, alpha = 0.05, ...)
\method{metric.shape}{drclass}(drc, alpha = 0.05, ...)
\method{metric.mode}{drclass}(drc, alpha = 0.05, ...)

}
\arguments{
  \item{p}{vector of probabilities according to q.}
  \item{q}{vector of quantiles according to p.}
  \item{dist.lower}{object of the class \code{\link{distribution}}.}
  \item{dist.upper}{object of the class \code{\link{distribution}}.}
  \item{x}{object of the class \code{drclass}}
  \item{object}{object of the class \code{drclass}}
  \item{drc}{object of the class \code{drclass}}
  \item{alpha}{Defines the credible level \code{1-alpha}.}
  \item{range}{Plotrange.}
  \item{plot.stat.values}{Statistical values are added to the plot if TRUE.}
  \item{makePDF}{Creates a pdf if TRUE else not.}
  \item{...}{Further arguments that can be passed to the function.}
}
\details{No details.}
\value{
  \item{name}{the name of the Density Ratio Class}
  \item{range}{the range of the Density Ratio Class}
  \item{p}{probabilities}
  \item{q}{quantiles}
  \item{dist.lower}{object of the class \code{\link{distribution}}}
  \item{dist.upper}{object of the class \code{\link{distribution}}}
}

\references{
S.L. Rinderknecht et al. Eliciting Density Ratio Classes, Int. J. Approx. Reason (2011),
doi10.1016/j.ijar.2011.02.002 and for the metrics see
S.L. Rinderknecht et al. Bridging uncertain and ambiguous knowledge with imprecise probabilities, submitted.
}

\author{Simon L. Rinderknecht}
%%\note{~~further notes~~}

\seealso{
See also \code{\link{fitDRC}} for general information and \code{\link{distribution}}, \code{\link{transformation}}, \code{\link{dist.trans.create}} for details.
}

\examples{
drc <- drclass.create (p = c(0.05,0.25,0.666,0.75,0.95),
                       q = qnorm(c(0.05,0.25,0.5,0.75,0.95)),
                       dist.lower = dist.normal.create(c(0,1)),
                       dist.upper = dist.normal.create(c(0,1)))
drc
print(drc)   # prints the Density Ratio Class.
summary(drc) # adds the metrics.
plot(drc)    # plots the Density Ratio Class.

Kappa(drc)
Lambda(drc)

metrics(drc) # all metrics.
metric.ci(drc, 0.1) # outer credible interval for 0.9 content

#####################################################################################
### if you want to create your own Density Ratio Class use the following template ###
#####################################################################################

# drclass.create <- function(p = c(yourProbabilities),    # according to q
#                           q = qnorm(c(yourQuantiles)),  # according to p
#                           dist.lower = dist.yourDistribution.create(par),
#                           dist.upper = dist. yourDistribution.create(par)  )
# {
#
# drc                      <- list()
# drc$name                 <- "yourDRCname"
# drc$range                <- dist.upper$range(dist.upper$par) 
# drc$p                    <- p
# drc$q                    <- q
# drc$dist.lower           <- dist.lower
# drc$dist.upper           <- dist.upper
# class(drc)               <- "drclass"
# return(drc)
# }

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}