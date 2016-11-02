library(shiny)
library(choroplethr)
data("df_state_demographics")

shinyUI(fluidPage(

  # Application title
  titlePanel("Census Explorer - by Ari Lamstein"),

  # Sidebar with a slider input for number of colors
  sidebarLayout(
    sidebarPanel(
      sliderInput("num_colors",
                  "Number of colors:",
                  min = 1,
                  max = 9,
                  value = 7),
      selectInput("select", label = "Select demographic:", 
                  choices = colnames(df_state_demographics)[2:9], 
                  selected = 1),
      
      downloadButton('downloadData', 'Download')
      ),

    mainPanel(
      plotOutput("map"),
      dataTableOutput('table')
    )
  )
))
