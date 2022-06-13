\name{EstCRM}
\alias{EstCRM}
\alias{EstCRM}
\docType{package}
\title{
Calibrating Parameters for the Samejima's Continuous Response Model
}
\description{
This package includes the tools to estimate model parameters for the Samejima's Continuous Response Model (CRM) via marginal maximum likelihood estimation and EM algorithm, to compute item fit residual statistics, to draw empirical 3D item category response curves, to draw theoretical 3D item category response curves, and to generate data under the CRM for simulation studies.
}
\details{
\tabular{ll}{
Package: \tab EstCRM\cr
Type: \tab Package\cr
Version: \tab 1.5\cr
Date: \tab 2022-06-13\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}

The package can be used to estimate item parameters by using \code{\link{EstCRMitem}}, to estimate person ability parameters by using \code{\link{EstCRMperson}}, to compute the item fit residual statistics after parameter calibration by using \code{\link{fitCRM}}, to draw empirical 3D item category response curves by using \code{\link{fitCRM}}, to draw theoretical 3D item category response curves by using \code{\link{plotCRM}}, and to generate data under the Continuous Response Model for the simulation studies by using \code{\link{simCRM}}.
}
\author{
Cengiz Zopluoglu

Maintainer: Cengiz Zopluoglu <cen.zop@gmail.com>
}
\references{
Kan, A.(2009). Effect of scale response format on psychometric properties in teaching self-efficacy. \emph{Euroasian Journal of Educational Research}, \emph{34}, 215-228.\cr

Ferrando, P.J.(2002). Theoretical and Empirical Comparison between Two Models for Continuous Item Responses. \emph{Multivariate Behavioral Research}, 37(4), 521-542.

Samejima, F.(1973). Homogeneous Case of the Continuous                Response Model. \emph{Psychometrika}, 38(2), 203-219.          

Shojima, K.(2005). A Noniterative Item Parameter Solution in Each EM Cycyle of the Continuous Response Model. \emph{Educational Technology Research}, 28, 11-22.

Wang, T. & Zeng, L.(1998). Item Parameter Estimation for a Continuous  Response Model Using an EM Algorithm. \emph{Applied Psychological Measurement}, 22(4), 333-343. 
}

\keyword{ package }
\seealso{
\code{\link{EstCRMitem}} for estimating item parameters,
\code{\link{EstCRMperson}} for estimating person parameters, 
\code{\link{fitCRM}} for computing item-fit residual statistics and drawing empirical 3D item category response curves,
\code{\link{plotCRM}} for drawing theoretical 3D item category response curves,
\code{\link{simCRM}} for simulating data under CRM.
}