#
# server.R

library(shiny)
library(dplyr)
library(data.table)


wine_DT = fread('winemag-data-130k-v2.csv')

wine_DT <- wine_DT[,.(country,points,price,description,taster_name)]

shinyServer(function(input, output, session) {
  
  output$results <- renderTable({
    filtered <- wine_DT %>% 
                filter(country %in% input$countryInput) %>% 
                filter(price <= input$priceInput)  %>% 
                arrange(desc(points))
    
    filtered <- head(filtered, 10)

    filtered
  })
  
})

  

