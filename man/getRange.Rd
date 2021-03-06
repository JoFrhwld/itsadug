% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/data_utility_functions.R
\name{getRange}
\alias{getRange}
\title{Utility function.}
\usage{
getRange(x, dec = NULL, step = NULL, n.seg = 2)
}
\arguments{
\item{x}{A numeric vector.}

\item{dec}{Number of decimal points for rounding using function
\code{\link[base]{round}}. Applied after argument
\code{step}. If NULL (default), no rounding is applied.}

\item{step}{Round the}

\item{n.seg}{Numeric value, number of values in the equally spaced sequence.
Default is 2 (min, max).}
}
\value{
vector, range of equally spaced sequence.
}
\description{
Utility function.
}
\examples{
zlim <- c(-2.5, 3.01)
# does not change anything:
getRange(zlim)
# create a range of 5 numbers:
# (basically just using seq )
getRange(zlim, n.seg=5)
# rounds the numbers:
getRange(zlim, dec=0)
getRange(zlim, n.seg=5, dec=0)
# extreme values are multiplications of 5
# that contains zlim values:
getRange(zlim, step=5)
getRange(zlim, step=5, n.seg=5)
# similar, but not the same:
getRange(zlim, n.seg=5, dec=0)
getRange(zlim, n.seg=5, step=1)
# combining:
getRange(zlim, n.seg=5, step=1, dec=0)
}
\author{
Jacolien van Rij
}
\seealso{
Other Data utility functions: \code{\link{findAbsMin}};
  \code{\link{find_n_neighbors}}; \code{\link{getDec}};
  \code{\link{group_sort}}; \code{\link{list2str}};
  \code{\link{move_n_point}}; \code{\link{print_summary}};
  \code{\link{summary_data}}; \code{\link{timeBins}}
}

