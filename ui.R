library(shiny)

# Define UI for learn about exploratory graphs application
shinyUI(fluidPage(
        
        # Application title
        headerPanel("Learn about Exploratory Graphs"),
        
        # Sidebar with controls to select the type of graph
        sidebarPanel(
                selectInput("variable", " Select the graph :",
                            list("Histogram" = "Histogram", 
                                 "Boxplot" = "Boxplot", 
                                 "Scatterplot" = "Scatterplot")),
                
               list( 
                       h3("About the Application"),
                       tags$li("The Application helps you to learn about the different type of graphs."),
                       tags$li("The dataset airquality has been used to create the sample graphs"),
                       tags$li("Select the graph name from the list above."),
                        tags$li("The application will display the following"),
                       tags$ol(
                               tags$li("Definition of the graph"),
                       tags$li("R code to create the graph"),
                       tags$li("A sample graph"))
                       
                       
               )
                        
                
        ),
        
        # Show the caption and plot of the requested graph
        mainPanel(
                h3(textOutput("caption")),
                
                tags$b("Definition"),
                
                (textOutput("definition")),
                
                
                tags$b("R Code"),
                h3(textOutput("code")),
                
                
                tags$b("Sample Plot"),
                plotOutput("expPlot")
        )
))

