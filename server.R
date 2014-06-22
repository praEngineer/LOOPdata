#setwd("C:/Users/Steven/GITrepoistories/datasciencecoursera/LOOPdata/data")
#dsLoops <- read.csv("loops.csv", header=TRUE, stringsAsFactors=FALSE)
#save(dsLoops,file="/data/LOOPs.rda")
#rm(dsLoops)

load("LOOPs.rda")
dfLOOPs <- data.frame(dsLoops)
library(shiny)
shinyServer(
  function(input, output) {
newdata <- reactive(subset(dfLOOPs, substr(EventDate,1,4) >=substr(format({input$odate[1]}),1,4) & substr(EventDate,1,4) <substr(format({input$odate[2]}),1,4) & LONG != "#N/A" & LONG != "0" & Grid==format({input$id2})  , select=c(Site,LONG,LAT,dteEventDate)))
    output$oid1 <- renderPrint({input$id1})
    output$oid2 <- renderPrint({input$id2})
    output$oid3 <- renderTable(head(newdata(), n = 200))
    output$odate <- renderPrint(paste(substr(format({input$odate[1]}),1,4) , "to" , substr(format({input$odate[2]}),1,4), sep = " ", collapse = NULL))
  }
  )
# library(ggmap)
# map <- get_map(location = "United States", zoom = 4)
# mapPoints <- ggmap(map)+geom_point(aes(x = LONG, y = LAT, size = 2), data = newdata, alpha = .5)
# mapPoints
