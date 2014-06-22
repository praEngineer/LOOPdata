library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Loss of Offsite Power Events"),
  sidebarPanel(
    radioButtons("id2","Grid Regions",
                       c("SERC" = "SERC",
                         "RFC" = "RFC",
                         "FRCC" = "FRCC",
                          "SPP" = "SPP",
                        "ERCOT" = "ERCOT",
                         "MRO" = "MRO",
                         "WSCC" = "WSCC",
                         "NPCC" = "NPCC"), selected = "MRO"),
    dateRangeInput("odate","Years of interest:", start = "1997-01-01", end = "2008-12-31",
    min ="1997-01-01", max ="2008-12-31", format = "yyyy",
    startview = "decade", weekstart = 0, language = "en",
    separator = " to "),
img(src="http://ts2.mm.bing.net/th?&id=HN.607995278554824776&w=300&h=300&c=0&pid=1.9&rs=0&p=0", height = 250, width = 250)
    ),
  mainPanel(
p("Because of weather or equipment problems AC power needed by commercial nuclear power plants is lost.  The events are
thought to be primarily related to the surrounding grid configuration and seasonal.  This program subsets events.  A later version
will plot the lattidue and longitude on a map of the United States."),
    h4('Selected Grid Region'),
    verbatimTextOutput("oid2"),
    h4('Years of interest:'),
    verbatimTextOutput("odate"),
    h4('LOOP Events found (* are multi-reactor sites):'),
    tableOutput("oid3") 
    )
  ))