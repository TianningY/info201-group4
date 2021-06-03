library(shiny)
library(dplyr)
library(ggplot2)
library(lubridate)
library(tidyr)
library(stringr)

shinyServer(
  function(input, output){
    housedata <- data.table::fread("data/housedata.csv")
    housedata$date = mdy(housedata$date)
    covid_data <- read.csv("data/covid_data.csv")
    covid_data <- filter(covid_data, County == 'King County')
    
    output$houseplot <- renderPlot({
      if(input$type == 'Overall'){
        data <- housedata %>%
          group_by(date) %>%
          summarise(mean_p = mean(price))
        title <- "Overall prices of houses sold in Seattle for the past year"
        y <- "Price(usd)"
        high <- 1.4e+06
        low <- 600000
        
        output$msg1 <- renderText({
          paste("The selected subset contains ", nrow(data), "observations")
        })
      }
      else if(input$type == 'price per sqft'){
        data <- housedata %>%
          group_by(date) %>%
          summarise(mean_p = mean(pps))
        title <- "Per square feet prices of houses sold in Seattle for the past year"
        y <- "Price per square feet(usd)"
        high <- 670
        low <- 400
        
        output$msg1 <- renderText({
          paste("The selected subset contains ", nrow(data), "observations")
        })
      }
      
      ggplot(data = data) +
        geom_point(mapping = aes(x = date, y = mean_p), col='steelblue')+
        geom_smooth(mapping = aes(x = date, y = mean_p), col='orangered1')+
        ylim(low, high) +
        labs(
          title = title, # plot title
          x = "Date", # x-axis label 
          y = y # y-axis label 
        ) 
      
    })
    
    output$covidplot <- renderPlot({
      covid_data$WeekStartDate = mdy(covid_data$WeekStartDate)
      ggplot(data = covid_data) +
        geom_point(mapping = aes(x = WeekStartDate, y = ConfirmedCases), col='orangered1')+
        geom_smooth(method = "lm", mapping = aes(x = WeekStartDate, y = ConfirmedCases), col='steelblue')+
        labs(
          # title = "Overall prices of houses sold in Seattle for the past year", # plot title
          x = "Date", # x-axis label 
          y = "Covid cases" # y-axis label 
        )
    })
    
  }
)