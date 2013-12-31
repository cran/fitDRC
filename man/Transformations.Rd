\name{Transformations}

\alias{transformation}
\alias{trans.tan.create}
\alias{trans.arctan.create}
\alias{trans.dil.create}
\alias{trans.log.create}
\alias{trans.exp.create}

\alias{print.transformation}
\alias{summary.transformation}
\alias{plot.transformation}

\alias{TRANS.RANGE.X}
\alias{TRANS.RANGE.Y}
\alias{TRANS.FORW}
\alias{TRANS.BACKW}
\alias{TRANS.DERIV}

\title{The class `transformation' in the fitDRC package: its constructors and methods.}

\description{
To transform a lower or upper distribution in order to find even a better fit for a \emph{Density Ratio Class}, one has firstly to specify an object of the class \code{transformation} due to the constructors \code{trans.transformationkind.create(par)} that are described in this help sheet.
Secondly, once an object of the class \code{transformation} is created use the function \code{\link{dist.trans.create}} to obtain an object of the class \code{\link{distribution}} that is finally used for fitting the \emph{Density Ratio Class} with the help of the function \code{\link{process.elidat}}.

Implemented tranformations are the \code{arctan}, \code{tan}, \code{dilation}, \code{log} and a particular \code{trans.exp.create} transformation. They are defined as follows:

\tabular{ll}{
   arctan: \tab \code{0.5*(Min+Max) + (Max-Min)/pi*atan(x)}      \cr
   tan:    \tab \code{tan(0.5*pi*(2*x-Max-Min)/(Max-Min))}       \cr
   dil:    \tab \code{(x-Min1) * (Max2-Min2)/(Max1-Min1) + Min2} \cr
   log:    \tab \code{log(x)}                                    \cr
   exp:    \tab \code{-(a/b^2) * exp(-b*x) + c*x + (a/b^2)}      \cr
   }

It is also possible to implement an own object of the class \code{transformation}. Do this by using the template below from the example section. 
}

\usage{
trans.arctan.create(par = NA)
trans.tan.create(par = NA)
trans.dil.create(par = NA)
trans.log.create(par = NA)
trans.exp.create(par = NA)

\method{print}{transformation}(x = trans,...)
\method{summary}{transformation}(object,...)
\method{plot}{transformation}(x = trans, par = trans$par, 
        range.x = NA, range.y = NA, what = "TRANS.FORW", plot = TRUE, 
        length = 101,...)
}

\arguments{
  \item{par}{vector of the parameters of the transformation, if not named in the implemented order. At least one parameter value has to be specified. Unspecified values will be default values as in the list below:
\tabular{ll}{
   arctan: \tab\code{ par = c("Min" = 0, "Max" = 1)                           }\cr
   tan:    \tab\code{ par = c("Min" = 0,"Max" = 1)                            }\cr
   dil:    \tab\code{ par = c("Min1" = 0, "Max1" = 1, "Min2" = 0, "Max2" = 1) }\cr
   log:    \tab\code{ par = c("-" = NA)                                       }\cr
   exp:    \tab\code{ par = c("a" = 0, "b" = 1, "c" = 0)                      }\cr
   }
}
  \item{x}{object of the class \code{transformation}.}
  \item{object}{object of the class \code{transformation}.}
  \item{plot}{used in the method \code{plot}; if TRUE creates a plot, else returns values.}
  \item{what}{used in the method \code{plot}; can be either \code{TRANS.FORW} or \code{TRANS.BACKW} or \code{TRANS.DERIV} and defines what is to be plotted.}
  \item{range.x}{specifies the x-range of the plot in the method \code{plot}.}
  \item{range.y}{specifies the y-range of the plot in the method \code{plot}.}
  \item{length}{specifies the number of evaluations within the range for the plot in the method \code{plot}.}
  \item{...}{further arguments that can be passed to the function.}
}

\details{
Implemented methods for objects of the class \code{transformation} are: \code{print} \code{summary} \code{plot}.
}

\value{
  \item{name}{the name of the transformation}
  \item{range.x}{the x-range of the transformation}
  \item{range.y}{the y-range of the transformation}
  \item{par.names}{the names of the transformation parameters}
  \item{par.ranges}{the ranges of the transformation parameters}
  \item{par}{the values of the transformation parameters}
  \item{trans.forw}{a function to calculate the forward transformation}
  \item{trans.backw}{a function to calculate the backward transformation}
  \item{trans.deriv}{a function to calculate the derivation of the transformation}
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
\code{\link{fitDRC}}, \code{\link{distribution}}, \code{\link{dist.trans.create}} and \code{\link{process.elidat}}.
}

\examples{
trans.arctan <- trans.arctan.create(c(0,10))
print(trans.arctan)
summary(trans.arctan)
#x11()
#plot(trans.arctan)
#plot(trans.arctan,what = "TRANS.BACKW")
#plot(trans.arctan,what = "TRANS.DERIV")

trans.tan <- trans.tan.create(c(0,10))
#x11()
#plot(trans.tan)
#plot(trans.tan,what = "TRANS.BACKW")
#plot(trans.tan,what = "TRANS.DERIV")

trans.log <- trans.log.create()
#x11()
#plot(trans.log,range.x=c(-1,1))
#plot(trans.log,what = "TRANS.BACKW",range.y=c(-1,1))
#plot(trans.log,what = "TRANS.DERIV",range.x=c(-1,1))

trans.dil <- trans.dil.create(c(0,1,4,5))
#x11()
#plot(trans.dil,range.x=c(-1,1))
#plot(trans.dil,what = "TRANS.BACKW", range.y = c(-1,1))
#plot(trans.dil,what = "TRANS.DERIV", range.x = c(-1,1))

trans.exp <- trans.exp.create(c(3, 2, 1))
#x11()
#plot(trans.exp,range.x=c(-1,1))
#plot(trans.exp,what = "TRANS.BACKW", range.y = c(-4,3))
#plot(trans.exp,what = "TRANS.DERIV", range.x = c(-1,1))

# implemented default values are:
trans.arctan.create(par = c(Min = 0, Max = 1))
trans.tan.create(par = c(Min = 0, Max = 1))
trans.dil.create(par = c("Min1" = 0, "Max1" = 1, "Min2" = 0, "Max2" = 1))
trans.log.create(par = c("-" = NA))
trans.exp.create(par = c("a" = 0, "b" = 1, "c" = 0))


##############################################################################
      ### if you want to create your own transformation read this ###
##############################################################################

# use the template below and replace the code in between *<* ... *>*
# accordingly. Do not forget to delete the *<* and *>* that are only used to
# indicate the custom fields.
# type 'trans.exp.create' to see an already implemented transformation.

################################################################################
### if you want to create your own transformation use the following template ###
################################################################################

# trans.*<*yournameofyourtransformation*>*.create <- function(par=c(NA)
# {
#   # set default parameter values:
#   par.default <- c(*<*NA,...*>*)
#   names(par.default) <- c(*<*"a",...*>*)
#   p <- mergePar(par,par.default)
#   # construct class:
#   trans             <- list()
#   trans$name        <- "*<*yourname"*>*
#   trans$range.x     <- function(par){*<*return(c(min.x,max.x))*>*}
#   trans$range.y     <- function(par){*<*return(c(min.y,max.y))*>*}
#   trans$par.names   <- names(p)
#   # ranges of the parameters of the transformation
#   trans$par.ranges  <- matrix(
#                               c(*<*-NA, +NA*>*,      # range of 1st parameter
#                                 *<*-NA, +NA*>*),     # range of 2nd par.....
#                               byrow=TRUE,ncol=2)
#   trans$par         <- p
#   trans$trans.forw  <- function(x,par)
#                        { y <- *<*yourForwardFormula(x,par)*>*
#                          return(as.numeric(y))
#                        }
#   trans$trans.backw <- function(y,par)
#                        { x <- *<*yourBackwardFormula(y,par)*>*
#                          return(as.numeric(x)) }
#   trans$trans.deriv <- function(x,par)
#                        { dydx <- *<*yourDerivationFormula(x,par)*>*
#                          return(as.numeric(dydx)) }
#   class(trans)      <- "transformation"
#   return(trans)
# }

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{transformation of distribution}