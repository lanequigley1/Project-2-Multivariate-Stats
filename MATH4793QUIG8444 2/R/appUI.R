#' Shiny app server object
#'
#' graphics hist
#'  

# create the shiny application user interface
library(shinydashboard)
library(shiny)
appUI <-dashboardPage( skin = "blue", 
                     dashboardHeader(title = "DDT Normality"),
                     dashboardSidebar( disable=TRUE), #disable = TRUE
                     dashboardBody( 
                       
                       fluidRow(
                        
                         tabBox(
                           title = "Normality Plots",
                           # The id lets us use input$tabset1 on the server to find the current tab
                           id = "tabset1", height = "500",
                           tabPanel("Scatterplots", plotOutput("scatterplots")),
                           tabPanel("QQplot", plotOutput("qqplot")),
                           tabPanel("Chi-Square",plotOutput("chisq"))
                         ),
                         
                         
                    
                         
                         box(
                           
                           status = "warning",
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           width = 3,
                           background= "black",
                           title = "Variables used in Scatter Plot Pairs",
                           numericInput("scatterVar1", "1:Mile 2:Length 3:Weight 4:DDT",value=2, min=1,max=4,step=1),
                           numericInput("scatterVar2", "1:Mile 2:Length 3:Weight 4:DDT",value=3, min=1,max=4,step=1)
                         ),
                         
                         box(
                           
                           status = "warning",
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           width = 3,
                           background= "black",
                           title = "Include Outliers?",
                           selectInput("outlier","Select Plot Type:",c("YES","NO"))
                           
                         ),
                         
                         box(
                           
                           status = "warning",
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           width = 3,
                           background= "black",
                           title = "Include Probablity Ellipse?",
                           selectInput("ellipse","Select Plot Type:",c("YES","NO")),
                           numericInput("percent", "Alpha of Ellipse",value=.95, min=.01,max=.99,step=.1)
                         )
                         
                         
                      
                         
                       )
                       
                       
                       
                     )
)

