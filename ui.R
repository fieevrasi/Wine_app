#
# ui.R

library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Find Best Wines by Country & Price"),
  

  # Sidebar with a select input and slider input
  sidebarLayout(
    sidebarPanel(
      helpText("Please select a country and a maximum price to find TOP10 wines."),
      selectInput("countryInput", "Country",
                   choices = c("Chile", "France", "Italy", "New Zealand", "Spain", "US"),
                   selected = "Argentiina"),
        sliderInput("priceInput", "Price", min = 10, max = 500, value = c(50), pre = "$")
    ),

    # Show a results 
    mainPanel(
      tableOutput("results")
    )
  )
))
