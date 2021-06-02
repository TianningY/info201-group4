


library('shiny')
library(shinythemes)
library(leaflet)

shinyUI(fluidPage(
  theme = shinytheme("flatly"),
  navbarPage(
    "Seattle Housing Data",
    # first tab
    tabPanel(
      "About",
      titlePanel("Project Overview"),
      h3("Data"),
      p(
        "Our project is an analysis of the prices of houses sold in Seattle for the past year",
        a("house data", href = "https://www.movoto.com/sold/seattle-wa/p-232/"),
        'and its relationship to Covid cases',
        a("covid data", href = "https://www.doh.wa.gov/Emergencies/COVID19/DataDashboard")
      ),
      p(
        "The housing data is from movoto.com and the Covid data is from Washington state department of health"
      ),
      h3("Purpose"),
      p("Some questions this app can answer are:"),
      tags$ul(
        tags$li(
          "Does covid cases have a corerelation with houses prices in seattle?"
        ),
        tags$li("How has the house prices in Seattle changed in the past year?")
      ),
      h3("Structure"),
      tags$ul(tags$li(
        p(
          "The first tab, ",
          tags$b("Prices of houses sold in Seattle for the past year"),
          "contains graphs showing the change of house pricing over time."
        )
      ),
      tags$li(
        p(
          "The second tab, ",
          tags$b("Active Covid cases in Seattle"),
          "contains a graph showing the trend of Active Covid cases in Seattle for the past year."
        )
      )),
      h3("Team Members"),
      tags$ul(tags$li("Eric Yu"),
              tags$li("Rinka Tonsho"))
    ),
    # second tab
    
    tabPanel(
      "Prices of houses sold in Seattle for the past year",
      titlePanel("House pricing in Seattle"),
      sidebarPanel(
        selectInput(
          'type',
          'Please select if you want to see the graph for mean overall price or mean price per square feet',
          choices = c('Overall', 'price per sqft')
        )
      ),
      mainPanel(plotOutput(outputId = "houseplot"),
                textOutput("msg1"))
    ),
    
    # third tab
    tabPanel(
      "Covid cases trend",
      titlePanel("Active Covid cases in King county, WA over time"),
      sidebarPanel(
        p(
          "This is the graph of Covid cases in King county overtime"
        )
      ),
      mainPanel(plotOutput(outputId = "covidplot")
      )
    )
))
)