



df = subset(housedata, select = -c(V1))
write.csv(housedata, 'data/housedata.csv')

housedata$price = parse_number(housedata$price)
regexp <- "[[:digit:]]+"

# process string
housedata$price = str_extract(housedata$price, regexp)
housedata$pps = str_extract(housedata$pps, regexp)
housedata <- filter(housedata, price >10000 & pps>10)

housedata$price = as.numeric(housedata$price)
housedata$pps = as.numeric(housedata$pps)
housedata <- drop_na(housedata)
housedata$ym <- format(as.Date(housedata$date), "%Y-%m")


housedata <- read.csv("data/housedata.csv")
housedata$date = mdy(housedata$date)
data <- housedata %>%
  group_by(date) %>%
  summarise(mean_p = mean(price))

ggplot(data = data) +
  geom_point(mapping = aes(x = date, y = mean_p), col='steelblue')+
  geom_smooth(mapping = aes(x = date, y = mean_p), col='orangered1')+
  ylim(500000, 2e+06) +
  labs(
    title = "Overall prices of houses sold in Seattle for the past year", # plot title
    x = "Date", # x-axis label 
    y = "Price(usd)" # y-axis label 
  ) 

covid_data <- read.csv("data/covid_data.csv")
covid_data <- filter(cc, County == 'King County')
covid_data$WeekStartDate = mdy(covid_data$WeekStartDate)
ggplot(data = covid_data) +
  geom_point(mapping = aes(x = WeekStartDate, y = ConfirmedCases), col='orangered1')+
  geom_smooth(method = "lm", mapping = aes(x = WeekStartDate, y = ConfirmedCases), col='steelblue')+
  labs(
    # title = "Overall prices of houses sold in Seattle for the past year", # plot title
    x = "Date", # x-axis label 
    y = "Covid cases" # y-axis label 
  )
