% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Constructor.R
\name{OutlierRemoval}
\alias{OutlierRemoval}
\title{Removes Outliers from specified numeric data by creating a linear model and evaluating the cooks distance of the data (Used in shiny app)}
\usage{
OutlierRemoval(data, x, y)
}
\arguments{
\item{...}{}
}
\value{
Produces a scatterplot of variables x and y from the data used without detected outliers.
}
\description{
Removes Outliers from specified numeric data by creating a linear model and evaluating the cooks distance of the data (Used in shiny app)
}
\examples{
OutlierRemoval
}
