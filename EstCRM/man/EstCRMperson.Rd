\name{EstCRMperson}
\alias{EstCRMperson}
\title{Estimating Person Parameters for the Continuous Response Model}
\description{
Estimate person parameters for the Continuous Response Model(Samejima,1973)
}
\usage{
EstCRMperson(data,ipar,min.item,max.item)
}
\arguments{
  \item{data}{ 
a data frame with \emph{N} rows and \emph{m} columns, with \emph{N} denoting the number of subjects and \emph{m} denoting the number of items. 
}
  \item{ipar}{ 
a matrix with \emph{m} rows and three columns, with \emph{m} denoting the number of items. The first column is the \emph{a} parameters, the second column is the \emph{b} parameters, and the third column is the \emph{alpha} parameters
}
  \item{min.item}{ 
a vector of length \emph{m} indicating the minimum possible score for each item. 
}
  \item{max.item}{
a vector of length \emph{m} indicating the maximum possible score for each item. 
}

}
\details{
Samejima(1973) derived the closed formula for the maximum likelihood estimate (MLE) of the person parameters (ability levels) under Continuous Response Model. Given that the item parameters are known, the parameter for person \emph{i} (ability level) can be estimated from the following equation:

\deqn{
MLE(\theta_{i})=\frac{\sum_{j=1}^m[a_{j}^2(b_{j}+\frac{z_{ij}}{\alpha_{j}})]}{\sum_{j=1}^m \alpha_{j}^2}
}{Please see the manual for the equation!}

As suggested in Ferrando (2002), the ability level estimates are re-scaled once they are obtained from the equation above. So, the mean and the variance of the sample estimates equal those of the latent distribution on which the estimation is based.

Samejima (1973) also derived that the item information is equal to:

\deqn{
I(\theta_{i})=a^2
}{Please see the manual for the equation!}

So, the item information is constant along the theta continuum in the Continuous Response Model. 

The asymptotic standard error of the MLE ability level estimate is the square root of the reciprocal of the total test information:

\deqn{
SE(\hat{\theta_{i}})=\sqrt\frac{1}{\sum_{j=1}^m a_{j}^2}
}{Please see the manual for the equation!}

In the Continuous Response Model, the standard error of the ability estimate is same for all examinees unless an examinee has missing data. If the examinee has missing data, the ability level estimate and its standard error is obtained from the available item scores.

}
\value{

\code{EstCRMperson()} returns an object of class "\code{CRMtheta}". An object of class "\code{CRMtheta}" contains the following component:\cr

  \item{thetas}{ a three column matrix, the first column is the examinee ID, the second column is the re-scaled theta estimate, the third column is the standard error of the theta estimate.}
}
\references{
Ferrando, P.J.(2002). Theoretical and Empirical Comparison between Two Models for Continuous Item Responses. \emph{Multivariate Behavioral Research}, 37(4), 521-542.

Samejima, F.(1973). Homogeneous Case of the Continuous                Response Model. \emph{Psychometrika}, 38(2), 203-219.          

Wang, T. & Zeng, L.(1998). Item Parameter Estimation for a Continuous  Response Model Using an EM Algorithm. \emph{Applied Psychological Measurement}, 22(4), 333-343. 
}

\author{
Cengiz Zopluoglu
}
\note{
See the examples of \code{\link{simCRM}} for an R code that runs a simulation to examine the recovery of person parameter estimates by \code{EstCRMperson}.
}

\seealso{
\code{\link{EstCRMitem}} for estimating item parameters, 
\code{\link{fitCRM}} for computing item-fit residual statistics and drawing empirical 3D item category response curves,
\code{\link{plotCRM}} for drawing theoretical 3D item category response curves,
\code{\link{simCRM}} for generating data under CRM.

}

\examples{

  \dontrun{
    #Load the dataset EPIA
    
    data(EPIA)
    
    ##Define the vectors "max.item" and "min.item". The maximum possible
    ##score was 112 and the minimum possible score was 0 for all items
    max.item <- c(112,112,112,112,112)
    min.item <- c(0,0,0,0,0)
    
    ##Estimate item parameeters
    CRM <- EstCRMitem(EPIA, max.item, min.item, max.EMCycle = 500, converge = 0.01)
    par <- CRM$param
    
    ##Estimate the person parameters
    
    CRMthetas <- EstCRMperson(EPIA,par,min.item,max.item)
    theta.par <- CRMthetas$thetas
    theta.par
    
    #Load the dataset SelfEff
    data(SelfEff)
    
    ##Define the vectors "max.item" and "min.item". The maximum possible
    ##score was 11 and the minimum possible score was 0 for all items
    
    max.item <- c(11,11,11,11,11,11,11,11,11,11)
    min.item <- c(0,0,0,0,0,0,0,0,0,0)
    
    ##Estimate the item parameters
    CRM2 <- EstCRMitem(SelfEff, max.item, min.item, max.EMCycle=200, converge=.01)
    par2 <- CRM2$param
    
    ##Estimate the person parameters
    
    CRMthetas2 <- EstCRMperson(SelfEff,par2,min.item,max.item)
    theta.par2 <- CRMthetas2$thetas
    theta.par2
  }
}
