\name{fitCRM}
\alias{fitCRM}
\title{Compute item fit residual statistics for the Continuous Response Model}
\description{
Compute item fit residual statistics for the Continuous Response Model as described in Ferrando (2002)
}
\usage{
fitCRM(data, ipar, est.thetas, max.item,group)
}
\arguments{
  \item{data}{
a data frame with \emph{N} rows and \emph{m} columns, with \emph{N} denoting the number of subjects and \emph{m} denoting the number of items. 
}
  \item{ipar}{
a matrix with \emph{m} rows and three columns, with \emph{m} denoting the number of items. The first column is the \emph{a} parameters, the second column is the \emph{b} parameters, and the third column is the \emph{alpha} parameters
}
  \item{est.thetas}{
object of class "\code{CRMtheta}" obtained by using \code{EstCRMperson()}
}
  \item{max.item}{
a vector of length \emph{m} indicating the maximum possible score for each item. 
}
  \item{group}{
an integer, number of ability groups to compute item fit residual statistics. Default 20.
}

}
\details{
The function computes the item fit residual statistics as decribed in Ferrando (2002). The steps in the procedure are as the following:

1- Re-scaled \if{latex}{\out{$\mathrel\theta$}}\ifelse{html}{\emph{\out{&theta;}}}{} estimates are obtained.

2-  \if{latex}{\out{$\mathrel\theta$}}\ifelse{html}{\emph{\out{&theta;}}}{} estimates are sorted and assigned to \emph{k} intervals on the \if{latex}{\out{$\mathrel\theta$}}\ifelse{html}{\emph{\out{&theta;}}}{} continuum.
 
3- The mean item score \if{latex}{\out{$\bar{X}_{mk}$}}\ifelse{html}{}{} is computed in each interval for each of the items.

4- The expected item score and the conditional variance in each interval are obtained with the item parameter estimates and taking the median theta estimate for the interval.

5- An approximate standardized residual for item \emph{m} at ability interval \emph{k} is obtained as:

\deqn{
z_{mk}= \frac{\bar{X}_{mk} - E(X_{m}|\theta_{k})}{\sqrt{\frac{\sigma^2(X_{m}|\theta_{k})}{N_{k}}}}
}{Please see the manual for the equation!}

}
\value{

\item{fit.stat}{ a data frame with \emph{k} rows and \emph{m+1} columns with \emph{k} denoting the number of ability intervals and \emph{m} denoting the number of items. The first column is the ability interval. Other elements are the standardized residuals of item \emph{m} in ability interval \emph{k}.
}

\item{emp.irf}{ a list of length \emph{m} with \emph{m} denoting the number of items. Each element is a 3D plot representing the item category response curve based on the empirical probabilities. See examples below.
}

}
\references{
Ferrando, P.J.(2002). Theoretical and Empirical Comparison between Two Models for Continuous Item Responses. \emph{Multivariate Behavioral Research}, 37(4), 521-542.
}

\author{
Cengiz Zopluoglu
}

\seealso{
\code{\link{EstCRMperson}} for estimating person parameters, 
\code{\link{EstCRMitem}} for estimating item parameters
\code{\link{plotCRM}} for drawing theoretical 3D item category response curves,
\code{\link{simCRM}} for generating data under CRM.
}

\examples{

  \dontrun{

    ##load the dataset EPIA
    
    data(EPIA)
    
    ##Define the vectors "max.item" and "min.item". The maximum possible
    ##score was 112 and the minimum possible score was 0 for all items
    
    max.item <- c(112,112,112,112,112)
    min.item <- c(0,0,0,0,0)
    
    ##Estimate item parameters
    
    CRM <- EstCRMitem(EPIA, max.item, min.item, max.EMCycle = 500, converge = 0.01)
    par <- CRM$param
    
    ##Estimate the person parameters
    
    CRMthetas <- EstCRMperson(EPIA,par,min.item,max.item)
    
    ##Compute the item fit residual statistics and empirical item category
    ##response curves
    
    fit <- fitCRM(EPIA, par, CRMthetas, max.item,group=10)
    
    ##Item-fit residual statistics
    
    fit$fit.stat
    
    ##Empirical item category response curves
    fit$emp.irf[[1]]   #Item 1
  }

}
