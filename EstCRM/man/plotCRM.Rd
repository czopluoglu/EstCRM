\name{plotCRM}
\alias{plotCRM}
\title{
Draw Three-Dimensional Item Category Response Curves
}
\description{
This function draws the 3D item category response curves given the item parameter matrix and the maximum and minimum possible values that examinees can get as a score for the item. This 3D representation is an extension of 2D item category response curves in binary and polytomous IRT models. Due to the fact that there are many possible response categories, another dimension is drawn for the response categories in the 3D representation.
}
\usage{
plotCRM(ipar, item, min.item, max.item)
}
\arguments{
  \item{ipar}{
a matrix with \emph{m} rows and three columns, with \emph{m} denoting the number of items. The first column is the \emph{a} parameters, the second column is the \emph{b} parameters, and the third column is the \emph{alpha} parameters
}
  \item{item}{
item number, an integer between 1 and \emph{m} with \emph{m} denoting the number of items
}
  \item{min.item}{
a vector of length \emph{m} indicating the minimum possible score for each item. 
}
  \item{max.item}{
a vector of length \emph{m} indicating the maximum possible score for each item. 
}

}

\value{

\item{irf}{ a 3D theoretical item category response curves}

}
\author{
Cengiz Zopluoglu
}

\seealso{
\code{\link{EstCRMitem}} for estimating item parameters, 
\code{\link{EstCRMperson}} for estimating person parameters, 
\code{\link{fitCRM}} for computing item-fit residual statistics and drawing empirical 3D item category response curves,
\code{\link{simCRM}} for generating data under CRM.
}

\examples{

  \dontrun{

    ##load the dataset EPIA
    
    data(EPIA)
    
    ##Define the vectors "max.item" and "min.item". The maximum possible
    ##score was 112 and the minimum possible score was 0 for all items
    
    min.item <- c(0,0,0,0,0)
    max.item <- c(112,112,112,112,112)
    
    ##Estimate item parameters
    
    CRM <- EstCRMitem(EPIA, max.item, min.item, max.EMCycle = 500, converge = 0.01)
    par <- CRM$param
    
    ##Draw theoretical item category response curves for Item 2
    plotCRM(par,2,min.item, max.item)
    }
}
