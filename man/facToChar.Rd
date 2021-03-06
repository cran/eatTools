\name{facToChar}
\alias{facToChar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Transform columns in a data frame}
\description{Function transforms all data frame columns of a specific class
into another class.}
\usage{
facToChar ( dataFrame, from = "factor", to = "character")}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataFrame}{
%%     ~~Describe \code{file} here~~
a data frame
}
  \item{from}{
%%     ~~Describe \code{file} here~~
which column class should be transformed?
}
  \item{to}{
%%     ~~Describe \code{file} here~~
target column class
}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
a data frame
}
\author{
Sebastian Weirich
}
\examples{
data(mtcars)
### original classes
sapply(mtcars, class)
mtcars1 <- facToChar(mtcars, from = "numeric", to = "character")
sapply(mtcars1, class)
}

