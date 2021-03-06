% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aqs_sampleData.R
\name{aqs_dailyData}
\alias{aqs_dailyData}
\alias{aqs_dailyData_bySite}
\alias{aqs_dailyData_byCounty}
\alias{aqs_dailyData_byState}
\alias{aqs_dailyData_byCBSA}
\title{Extract daily average data data from the AQS API}
\usage{
aqs_dailyData(
  aqs_user,
  endpoint = c("bySite", "byCounty", "byState", "byBox", "byCBSA"),
  param,
  bdate,
  edate,
  state = NULL,
  county = NULL,
  site = NULL,
  cbdate = NULL,
  cedate = NULL,
  cbsa = NULL,
  minlat = NULL,
  maxlat = NULL,
  minlon = NULL,
  maxlon = NULL,
  ...
)

aqs_dailyData_bySite(aqs_user, param, bdate, edate, state, county, site, ...)

aqs_dailyData_byCounty(aqs_user, param, bdate, edate, state, county, ...)

aqs_dailyData_byState(aqs_user, param, bdate, edate, state, ...)

aqs_dailyData_byCBSA(aqs_user, param, bdate, edate, cbsa, ...)
}
\arguments{
\item{aqs_user}{User information in the form of a list with \code{email} and \code{key}. See \code{\link{create_user}}.}

\item{endpoint}{Service endpoint}

\item{param}{Parameter code for which to extract data. Up to five codes may included in a single request.}

\item{bdate}{Begin date for data sample interval. Should be a string in format "YYYYMMDD"}

\item{edate}{End date for data sample interval. Should be a string in format "YYYYMMDD". Must be from the same year as \code{edate}.}

\item{state}{Two-digit state code. Required when \code{endpoint} is one of \code{byState}, \code{byCounty}, \code{bySite}.}

\item{county}{Three-digit county code. Required when \code{endpoint} is \code{byCounty} or \code{bySite}.}

\item{site}{Three-digit site code. Required when \code{endpoint} is \code{bySite}.}

\item{cbdate}{Optional begin date for the date of last change interval. Should be a string in format "YYYYMMDD". If \code{cbdate} is provided, so much \code{cedate}.}

\item{cedate}{Optional end date for data of last change interval. Should be a string in format "YYYYMMDD". If \code{cedate} is provided, so much \code{cbdate}.}

\item{cbsa}{Three-digit census-bureau statistical area (CBSA) code. Required when \code{endpoint} is \code{byCBSA}.}

\item{minlat}{Minimum latitude for the bounding box. Required when \code{endpoint} is \code{byBox}.}

\item{maxlat}{Maximum latitude for the bounding box. Required when \code{endpoint} is \code{byBox}.}

\item{minlon}{Minimum longitude for the bounding box. Required when \code{endpoint} is \code{byBox}.}

\item{maxlon}{Maximum longitude for the bounding box. Required when \code{endpoint} is \code{byBox}.}

\item{...}{Additional arguments passed to \code{\link{aqs_get}}}
}
\description{
Extract daily average data data from the AQS API
}
\seealso{
\code{\link{aqs_get}}

Other Data Query Functions: 
\code{\link{aqs_annualData}()},
\code{\link{aqs_sampleData}()}
}
\concept{Data Query Functions}
