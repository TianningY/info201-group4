


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
    ),
    
    #sUMMARY TAB
    tabPanel(
      'Conclusion',
      titlePanel("Project Summary"),
      h3("Notable insight"),
      p(
        "The goal of this project is to find out if there is a relationship between covid cases and real estate prices in Seattle,  
        the result can show a correlation between the two, rather than direct influence because there are too many factors that can 
        affect real estate prices. From plots in the housing price tab and covid data type the trends seem to have a positive correlation, 
        higher covid cases correspond to an increase in house price. "
      ),
      h3("Notable insight"),
      p(
        "After I did further research, I found out that both the spike in covid cases and increase in house pricing might relate to another factor
        - the restrictions State lifted after more people get vaccined. As the influence of Covid epidemic gradually fade away, the
         demand of housing market rises while supply is limited which increased housing prices in Seattle. Without the state regulations more
         people decide to go out instead of staying at home which contributed to the spike in Covid cases."
      ),
      h3("Futre ideas and data quality"),
      p(
        "The data quality is ok, they are from well maintained websites, the data cleaning process is not really hard. However 
        there is a flaw that i really want to fix in the future. that is I could only find data of houses sold for the past one year in Seattle, I think this project would be more exciting if i can find more data."
      )
      
    )
))
)