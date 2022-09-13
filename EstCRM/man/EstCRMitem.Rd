\name{EstCRMitem}
\alias{EstCRMitem}
\title{Estimating Item Parameters for the Continuous Response Model}
\description{
Estimate item parameters for the Continuous Response Model (Samejima,1973)
}
\usage{
EstCRMitem(data, max.item, min.item, max.EMCycle = 500, converge = 0.01,
           type="Shojima",BFGS=TRUE)
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
a number of maximum EM Cycles used in the iteration. Default 500.
}
  \item{converge}{
a criteria value indicating the difference between loglikelihoods of two consecutive EM cycles to stop the iteration. Default .01 
}
  \item{type}{
type of optimization. Takes two values, either "Shojima" or "Wang&Zeng". Default is the non-iterative EM developed by Shojima(2005). See details.
}
  \item{BFGS}{
a valid argument when \code{type} is equal to "Wang&Zeng". If TRUE, the Broyden-Fletcher-Goldfarb-Shanno (BFGS) algorithm is used to update Hessian.
}
}
\details{
Samejima (1973) proposed an IRT model for continuous item scores as a limiting form of the graded response model. Even though the Continuous Response Model (CRM) is as old as the well-known and popular binary and polytomous IRT models, it is not commonly used in practice. This may be due to the lack of accessible computer software to estimate the parameters for the CRM. Another reason might be that the continuous outcome is not a type of response format commonly observed in the field of education and psychology. There are few published studies that used the CRM (Ferrando, 2002; Wang & Zeng, 1998). In the field of education, the model may have useful applications for estimating a single reading ability from a set of reading passages in the Curriculum Based Measurement context. Also, this type of continuous response format may be more frequently observed in the future as the use of computerized testing increases. For instance, the examinees or raters may check anywhere on the line between extremely positive and extremely negative in a computerized testing environment rather than responding to a likert type item. 

Wang & Zeng (1998) proposed a re-parameterized version of the CRM. In this re-parameterization, the probability of an examinee \emph{i} with a spesific \if{latex}{\out{$\mathrel\theta$}}\ifelse{html}{\emph{\out{&theta;}}}{} obtaining a score of \emph{x} or higher on a particular item \emph{j} with a continuous measurement scale ranging from 0 to \emph{k} and with the parameters \emph{a}, \emph{b}, and \if{latex}{\out{$\mathrel\alpha$}}\ifelse{html}{\emph{\out{&alpha;}}}{} is defined as the following:\cr
\deqn{
P(X_{ij} \geq x|\theta_{i},a_{j},b_{j},\alpha_{j})=\frac{1}{\sqrt{2\pi}}\int\limits_{-\infty}^{v}{e^{\frac{-t^2}{2}}dt}
}{Please see the manual for the equation!}
\eqn{
v=a_{j}(\theta_{i}-b_{j}-\frac{1}{\alpha_{j}}ln\frac{x_{ij}}{k_{j}-x_{ij}})
}{}\cr

where \emph{a} is a discrimination parameter, \emph{b} is a difficulty parameter, and \if{latex}{\out{$\mathrel\alpha$}}\ifelse{html}{\emph{\out{&alpha;}}}{} represents a scaling parameter that defines some scale transformation linking the original observed score scale to the \if{latex}{\out{$\mathrel\theta$}}\ifelse{html}{\emph{\out{&theta;}}}{} scale (Wang & Zeng, 1998). \emph{k} is the maximum possible score for the item. \emph{a} and \emph{b} in this model have practical meaning and are interpreted same as in the binary and polytomous IRT models. \if{latex}{\out{$\mathrel\alpha$}}\ifelse{html}{\emph{\out{&alpha;}}}{} is a scaling parameter and does not have a practical meaning.

In the model fitting process, the observed \emph{X} scores are first transformed to a random variable \emph{Z} by using the following equation:\cr
\deqn{
Z_{ij}=ln(\frac{X_{ij}}{k_{j}-X_{ij}})
}{Please see the manual for the equation!}

Then, the conditional probability density function of the random variable \emph{Z} is equal to:\cr
\deqn{
{f}(z_{ij}|\theta_{i},a_{j},b_{j},\alpha_{j})=\frac{a_{j}}{\sqrt{2\pi}\alpha_{j}}exp^{-\frac{[a_{j}(\theta_{i}-b_{j}-\frac{z_{ij}}{\alpha_{j}})]^2}{2}}
}{Please see the manual for the equation!}

The conditional pdf of \emph{Z} is a normal density function with a mean of \if{latex}{\out{$\mathrel\alpha$}}\ifelse{html}{\emph{\out{&alpha;}}}{}(\if{latex}{\out{$\mathrel\theta$}}\ifelse{html}{\emph{\out{&theta;}}}{}-\emph{b}) and a variance of \if{latex}{\out{$\mathrel\alpha^2$}}\ifelse{html}{\emph{\out{&alpha;}^2}}{}/ \if{latex}{\out{$a^2$}}\ifelse{html}{a^2}{}.\cr

Wang & Zeng (1998) proposed an algorithm to estimate the CRM parameters via marginal maximum likelihood and Expectation-Maximization (EM) algorithm. In the Expectation step, the expected log-likelihood function is obtained based on the integration over the posterior \if{latex}{\out{$\mathrel\theta$}}\ifelse{html}{\emph{\out{&theta;}}}{} distribution by using the Gaussian quadrature points. In the Maximization step, the parameters are estimated by solving the first and second derivatives of the expected log-likelihood function with rescpect to \emph{a}, \emph{b}, and \if{latex}{\out{$\mathrel\alpha$}}\ifelse{html}{\emph{\out{&alpha;}}}{} parameters via Newton-Raphson procedure. A sequence of E-step and M-step repeats until the difference between the two consecutive loglikelihoods is smaller than a convergence criteria. This procedure is available through \code{type="Wang&Zeng"} argument. If \code{type} is equal to "Wang&Zeng", then user can specify \code{BFGS} argument as either TRUE or FALSE. If \code{BFGS} argument is TRUE, then the Broyden-Fletcher-Goldfarb-Shanno (BFGS) algorithm is used to approximate Hessian.  If \code{BFGS} argument is FALSE, then the Hessian is directly computed.\cr

Shojima (2005) simplified the EM algorithm proposed by Wang & Zeng(1998). He derived the closed formulas for computing the loglikelihood in the E-step and estimating the parameters in the M-step (please see the reference paper below for equations). He showed that the equations of the first derivatives in the M-step can be solved algebraically by assuming flat (non-informative) priors for the item parameters.  This procedure is available through \code{type="Shojima"} argument.  \cr

}

\value{

\code{EstCRMitem()} returns an object of class "\code{CRM}". An object of class "\code{CRM}" is a list containing the following components:

    \item{data}{ original data}
    \item{descriptive}{ descriptive statistics for the original data and the transformed z scores}
    \item{param}{ estimated item parameters in the last EM Cycle}
    \item{iterations}{ a list that reports the information for each EM cycle}
    \item{dif}{The difference of loglikelihoods between the last two EM cycles}

}

\references{

Ferrando, P.J.(2002). Theoretical and Empirical Comparison between Two Models for Continuous Item Responses. \emph{Multivariate Behavioral Research}, 37(4), 521-542.\cr

Samejima, F.(1973). Homogeneous Case of the Continuous                Response Model. \emph{Psychometrika}, 38(2), 203-219.\cr          

Shojima, K.(2005). A Noniterative Item Parameter Solution in Each EM Cycyle of the Continuous Response Model. \emph{Educational Technology Research}, 28, 11-22.\cr

Wang, T. & Zeng, L.(1998). Item Parameter Estimation for a Continuous  Response Model Using an EM Algorithm. \emph{Applied Psychological Measurement}, 22(4), 333-343.                                                                                                          
}
\author{
Cengiz Zopluoglu
}

\note{
* The ID variable ,if included, has to be excluded from the data before the analysis. If the format of the data is not a "data frame", the function does not work. Please use "as.data.frame()" to change the format of the input data.\cr

* A previous published simulation study (Shojima, 2005) was replicated as an example to check the performance of \code{EstCRMitem()}.Please see the examples of \code{\link{simCRM}} in this package.\cr

*The example below is a reproduction of the results from another published study (Ferrando, 2002). Dr. Ferrando kindly provided the dataset used in the published study. The dataset was previously analyzed by using EM2 program and the estimated CRM item parameters were reported in Table 2 in the paper. The estimates from \code{EstCRMitem()} is comparable to the item parameter estimates reported in Table 2.
}

\seealso{
\code{\link{EstCRMperson}} for estimating person parameters, 
\code{\link{fitCRM}} for computing item-fit residual statistics and drawing empirical 3D item category response curves,
\code{\link{plotCRM}} for drawing theoretical 3D item category response curves,
\code{\link{simCRM}} for generating data under CRM.
}

\examples{
  
  \dontrun{
  
  ##load the dataset EPIA
  data(EPIA)
  
  ##Check the class. "data.frame" is required.
  class(EPIA)
  
  ##Define the vectors "max.item" and "min.item". The maximum possible
  ##score was 112 and the minimum possible score was 0 for all items
  
  max.item <- c(112,112,112,112,112)
  min.item <- c(0,0,0,0,0)
  
  ##The maximum number of EM Cycle and the convergence criteria can be
  ##specified
  
  max.EMCycle=200
  converge=.01
  
  ##Estimate the item parameters
  CRM <- EstCRMitem(EPIA, max.item, min.item, max.EMCycle, converge)
  CRM
  
  ##Other details
  
  CRM$descriptive
  CRM$param
  CRM$iterations
  CRM$dif
  
  ##load the dataset SelfEff
  
  data(SelfEff)
  
  ##Check the class. "data.frame" is required.
  
  class(SelfEff)
  
  ##Define the vectors "max.item" and "min.item". The maximum possible
  ##score was 11 and the minimum possible score was 0 for all items
  
  max.item <- c(11,11,11,11,11,11,11,11,11,11)
  min.item <- c(0,0,0,0,0,0,0,0,0,0)
  
  ##Estimate the item parameters
  CRM2 <- EstCRMitem(SelfEff, max.item, min.item, max.EMCycle=200, converge=.01)
  CRM2
  
  ##Other details
  
  CRM2$descriptive
  CRM2$param
  CRM2$iterations
  CRM2$dif
  }
}

