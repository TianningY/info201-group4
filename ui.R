


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
        "The housing data is from movoto.com and the COVID-19 data is from Washington State Department of Health."
      ),
      h3("Purpose"),
      p("Some questions this app can answer are:"),
      tags$ul(
        tags$li(
          "Does COVID-19 cases have a corerelation with houses prices in Seattle?"
        ),
        tags$li("How has the house prices in Seattle changed over the past year?")
      ),
      h3("Structure"),
      tags$ul(tags$li(
        p(
          "The first tab, ",
          tags$b("Prices of houses sold in Seattle for the past year"),
          "This graph shows the change of housing prices in Seattle from around June
          of 2020 to May of 2021."
        )
      ),
      tags$li(
        p(
          "The second tab, ",
          tags$b("Active Covid cases in Seattle"),
          "contains a graph showing the trend of active COVID-19 cases in Seattle from around
          March 2020 to May 2021."
        )
      )),
      h3("Team Members"),
      tags$ul(tags$li("Eric Yu"),
              tags$li("Rinka Tonsho")),
      img(src = "covid.png")
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
        ),
        textOutput("dec")
      ),
      mainPanel(plotOutput(outputId = "houseplot"),
                textOutput("msg1"))
    ),
    
    # third tab
    tabPanel(
      "COVID-19 cases trend",
      titlePanel("Active COVID-19 cases in King county, WA over time"),
      sidebarPanel(
        p(
          "This is the graph of COVID-19 cases in King county overtime"
        )
      ),
      mainPanel(plotOutput(outputId = "covidplot")
      )
    ),
    
    #SUMMARY TAB
    tabPanel(
      'Conclusion',
      titlePanel("Project Summary"),
      h3("Notable insight"),
      p(
        "The goal of this project is to find out if there is a relationship between COVID-19 cases and real estate prices in Seattle.  
        The results shows a correlation between the two, but rather than there being a direct influence, we need to keep in mind that 
        there could be many other factors that affect the results such as incentivizing policies by the governemnt and the state of the economic market.
        There seems to be an upward trend in house pricing starting January of 2021, which correlates to the decreasing number of COVID-19 cases.
        From this, we can conclude that the drop in COVID-19 cases leads to a rise in housing prices.
        
        After I did further research, I found out that both the spike in COVID-19 cases and increase in house pricing might relate to another factor
        - the restrictions by the state were alleviated after the increase in vaccine rollout rates. As the effect of the pandemic gradually faded away, 
        housing demands rose while supply was limited (also due to the pandemic), which increased housing prices in Seattle. Without strict state regulations,
        it can be inffered that more people decided to go out instead of staying at home, which contributed to the spike in COVID-19 cases obsereved around December."
      ),
      h3("The broader implications"),
      p(
        "This data can be useful for people who are looking to buy a house in Seattle. The housing market in Seattle, and people looking
        to buy a house in the near future should do so as soon as possible to get the best prices. This information can also tell us about the whole enconomic market in general.
        The number of COVID-19 cases in the state of Washington is decreasing, and the market is starting to open up again, which indicates the overcoming of the economic impact
        from the COVID-19 pandemic."
      ),
      h3("Futre ideas and data quality"),
      p(
        "The data quality is decent, as they are from  well-aintained websites. The data cleaning process was not really hard. However, 
        one flaw we want to fix in the future is that we could only find data of houses sold for the past year in Seattle, and could not get a good grasp of the Seattle housing
        situation before and at the start of the pandemic. One thing that we can say for certain is that the housing market in Seattle has started to see a shift almost in line with
        the start of vaccine roll-out and lower COVID-19 cases. In addition, we only examined housing price data from one website, which could potentially lean towards a certain group of houses
        or people. In the future, we hope to gain a bigger dataset to gain an understanding of the bigger picture."
      )
      
    )
))
)