
#' Shiny app server function
#'
#' @param input provided by shiny
#' @param output provided by shiny
#'

library(shiny)

# Define server logic required to draw a histogram
appServer <- function(input, output) {
  

  output$scatterplots <- renderPlot({
   
      
      if(input$outlier=="YES" && input$ellipse=="NO"){
      myScatterPairs(ddt,input$scatterVar1,input$scatterVar2)
      }
      
      else if(input$outlier=="NO" && input$ellipse=="NO"){
        OutlierRemoval(ddt,input$scatterVar1,input$scatterVar2)
      }
      
      else if(input$outlier=="NO" && input$ellipse=="YES"){
        OutlierRemovalE(ddt,input$scatterVar1,input$scatterVar2,input$percent)
      }
      else{
        myScatterPairsE(ddt,input$scatterVar1,input$scatterVar2,input$percent)
      }
    
    
  })
  
  output$qqplot<- renderPlot({
    myqq(ddt)
  })
  
  output$chisq<- renderPlot({
    chisqplot(ddt)
  })
  
  
}

