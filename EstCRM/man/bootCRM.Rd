\name{bootCRM}
\alias{bootCRM}
\title{
Computing Standard Errors for Item Parameter Estimates using Bootstrap Sampling
}
\description{
Computes the standard errors of item parameter estimates using a non-parametric bootstrapping approach
}
\usage{
bootCRM(data,max.item,min.item,max.EMCycle=500,converge=.01,
        type="Shojima",BFGS=TRUE,nsample=50)
}

\arguments{
  \item{data}{
a data frame with \emph{N} rows and \emph{m} columns, with \emph{N} denoting the number of subjects and \emph{m} denoting the number of items.
}
\item{max.item}{
a vector of length \emph{m} indicating the maximum possible score for each item.
}
\item{min.item}{
a vector of length \emph{m} indicating the minimum possible score for each item. 
}
\item{max.EMCycle}{
a number of maximum EM Cycles used in the iteration. Default is 500.
}
\item{converge}{
a criteria value indicating the difference between loglikelihoods of two consecutive EM cycles to stop the iteration. Default is .01 
}
\item{type}{
type of optimization. Default is the non-iterative EM 
developed by Shojima(2005). 
}
\item{BFGS}{
a valid argument when \code{type} is equal to "Wang&Zeng". If TRUE, the Broyden-Fletcher-Goldfarb-Shanno (BFGS) algorithm is used to update Hessian.
}
\item{nsample}{
a number of bootstrap samples used in estimating the standard errors. Default is 50
}
}
\details{

\code{bootCRM} computes the standard errors of item parameter estimates using a non-parametric bootstrap sampling approach. 
}
\value{

\code{bootCRM} returns a list with three elements. Each element of the list is an \emph{m}x3 matrix where \emph{m} is the number of items. The first column includes the item parameter estimates from the original sample, the second column includes the average item parameter estimates from R bootstrap samples (the mean of the empirical sampling distribution), and the third column includes the standard errors of the item parameter estimates obtained from bootstrap samples (standard deviation of the empirical sampling distribution).

	\item{Discrimination}{Estimates for item discriminations}

	\item{Difficulty}{Estimates for item difficulties}

	\item{Alpha}{Estimates for alpha parameters}

}

\author{
Cengiz Zopluoglu
}

\note{
It may make take too long to get the results if you request a large number of bootstrap samples. By default, the number of bootstrap samples is 50, and it takes a couple minutes for the sample datasets provided in the package. It would be a good idea to try 100 or 500 bootstrap samples if you have enough time.
}


\seealso{
\code{\link{EstCRMitem}} for estimating item parameters, 
\code{\link{EstCRMperson}} for estimating person parameters, 
\code{\link{fitCRM}} for computing item-fit statistics and drawing empirical 3D item response curves,
\code{\link{plotCRM}} for drawing theoretical 3D item category response curves,

}
\examples{
  
  \dontrun{
  
  ##load the dataset EPIA
  data(EPIA)
  
  bootCRM(data=EPIA,
  max.item=c(112,112,112,112,112),
  min.item=c(0,0,0,0,0),
  max.EMCycle=200,
  converge=.01,
  nsample=100)
  
  
  ##load the dataset SelfEff
  data(SelfEff)
  
  bootCRM(data=SelfEff,
  max.item=c(11,11,11,11,11,11,11,11,11,11),
  min.item=c(0,0,0,0,0,0,0,0,0,0),
  max.EMCycle=200,
  converge=.01,
  nsample=100)
  }
}