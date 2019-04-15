#' Basic Multivariate Data Statistics (number of qualitative and quantitave variable, numder of observations, mean and covariance etc. see vignette)
#'
#' @param ...
#' 
#' 
#' @return List of statistics of the data
#' @export
#'
#' @examples dataSummary


dataSummary= function(data){
 
  numdata=dplyr::select_if(data, is.numeric)
  
  numVars=length(data)
  numberNumVars=length(numdata)
  numObs=nrow(data)
  tempvect1=colMeans(numdata)
  meanVector=as.vector(tempvect1)
  covMatrix=cov(numdata)
  correlationMatrix=cor(numdata)
  eigenData=eigen(covMatrix)
  
  

  list(covariance=covMatrix,meanVector=meanVector,correlationMatrix=correlationMatrix,numberOfVariables=numVars,numberNumericVariables=numberNumVars,numberObservations=numObs,eigenData=eigenData)
}




#' Q-Q plot for Numeric Data of four variables. Adds normal line to each plot in a 2x2 grid layout.(Used in shinyapp)
#'
#' @param ...
#'
#' @return Produces a Q-Qplot with normal line through the data on a 2x2 grid layout.
#' @export
#'
#' @examples myqq
myqq = function(data){
  numdata=dplyr::select_if(data, is.numeric)
  
  length=length(numdata)
  layout(matrix(c(1:length),nr=2,nc=2))
  
  
  
  for(i in 1:length){
    
    qqnorm(numdata[,i])
    qqline(numdata[,i])
    
    
  }
  
  
}
#' Produces scatterplots of selected pairs, with ellipse confidence intervals, of numeric variables (Used in shiny app)
#'
#' @param ...
#'
#' @return Produces a scatterplot of variables x and y from the data used.
#' @export
#'
#' @examples myScatterPairs
myScatterPairs = function(data,x,y){
  
  numdata=dplyr::select_if(data, is.numeric)
  
  layout(1)
  
  plot(numdata[,x],numdata[,y])
  
}

#' Produces scatterplots of selected pairs, with ellipse confidence intervals, of numeric variables (Used in shiny app)
#' Also provides a probability ellipse around the data with a specified alpha
#'
#' @param ...
#'
#' @return Produces a scatterplot of variables x and y from the data used. Uses percent to create a probability ellipse
#' @export
#'
#' @examples myScatterPairsE 
myScatterPairsE = function(data,x,y,percent){
  
  numdata=dplyr::select_if(data, is.numeric)
  
  layout(1)
  
  car::dataEllipse(numdata[,x],numdata[,y],levels=c(percent))
  
}


#' Removes Outliers from specified numeric data by creating a linear model and evaluating the cooks distance of the data (Used in shiny app)
#' 
#'
#' @param ...
#'
#' @return Produces a scatterplot of variables x and y from the data used without detected outliers. 
#' @export
#'
#' @examples OutlierRemoval
OutlierRemoval=function(data,x,y){
  
  numdata=dplyr::select_if(data, is.numeric)
  mod <- lm(numdata[,x] ~ numdata[,y], data = numdata)
  cooksd <- cooks.distance(mod)
  influential <- as.numeric(names(cooksd)[(cooksd > (4/nrow(numdata)))])
  test=matrix(c(numdata[,x],numdata[,y]),nr=nrow(numdata),nc=2,byrow=FALSE)
  newData=test[-influential,]
  
  plot(newData[,1],newData[,2])
  
}

#' Removes Outliers from specified numeric data by creating a linear model and evaluating the cooks distance of the data (Used in shiny app)
#' Also provides a probability ellipse around the data with a specified alpha
#'
#' @param ...
#'
#' @return Produces a scatterplot of variables x and y from the data used without detected outliers.  Uses percent to create a probability ellipse
#' @export
#'
#' @examples OutlierRemovalE
OutlierRemovalE=function(data,x,y,percent){
  
  numdata=dplyr::select_if(data, is.numeric)
  mod <- lm(numdata[,x] ~ numdata[,y], data = numdata)
  cooksd <- cooks.distance(mod)
  influential <- as.numeric(names(cooksd)[(cooksd > (4/nrow(numdata)))])
  test=matrix(c(numdata[,x],numdata[,y]),nr=nrow(numdata),nc=2,byrow=FALSE)
  newData=test[-influential,]
  
  car::dataEllipse(newData[,1],newData[,2],levels = c(percent))
  
}

#' Takes in data and produces a chi-square plot by finding the mean squared distances and chi-square quantiles associated with the numeric variables.
#' 
#'
#' @param ...
#'
#' @return Uses numeric data variables to produce a chi-square plot in order to help assess normality.
#' @export
#'
#' @examples chisqplot
chisqplot=function(data){
  
  
  numdata=dplyr::select_if(data, is.numeric)
  
  x1=numdata[,1]
  x2=numdata[,2]
  x3=numdata[,3]
  x4=numdata[,4]
  
  mat=matrix(c(x1,x2,x3,x4),nr=144,nc=4,byrow=FALSE)
  mat
  cov=cov(mat)
  
  mean(mat)
  
  dj=vector()
  for(i in 1:144){
    dj[i]=t((mat[i,]-mean(mat)))%*%(solve(cov))%*%(mat[i,]-mean(mat))
    
  }
  chisq=vector()
  
  for(i in 1:144){
    
    chisq[i]=qchisq(p=((i-.5)/144),df=4)
    
    
  }
  
  plot(chisq,dj)
  #list(dj=dj,chiq=chiq)
  
}

