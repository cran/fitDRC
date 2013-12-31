\name{dist.trans.create}
\alias{dist.trans.create}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Transformed distributions.
}
\description{
Function that transforms a distribution.}
\usage{
dist.trans.create(dist, trans)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dist}{Object of the class \code{\link{distribution}}.}
  \item{trans}{Object of the class \code{\link{transformation}}.}
}
\details{
no details}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{\code{distribution}}{Transformed distribution as an object of the class \code{\link{distribution}}.}
}
\references{
Rinderknecht, S.L., Borsuk, M.E. and Reichert, P. Eliciting Density Ratio Classes. International Journal of Approximate Reasoning 52, 792-804, 2011. doi10.1016/j.ijar.2011.02.002. \\
Rinderknecht, S. L., Borsuk, M. E. and Reichert, P. Bridging Uncertain and Ambiguous Knowledge with Imprecise Probabilities, Environmental Modelling & Software 36, 122-130, 2012.
}
\author{
Simon L. Rinderknecht}

%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See also \code{\link{fitDRC}}.
}
\examples{
## Example 01 ##
trans.tan <- trans.tan.create(c(33,99))
dist.student <- dist.student.create(c(0,1,1000))
dist  <- dist.trans.create(dist.student,trans.tan)
dist
#plot(dist)

## Example 02 ##
trans.arctan <- trans.arctan.create(c(0,10))
dist.uniform <- dist.uniform.create(c(0,10))
dist         <- dist.trans.create(dist.uniform,trans.arctan)
dist
#plot(dist)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ transformed distributions }
