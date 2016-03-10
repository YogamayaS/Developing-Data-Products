library(shiny)
library(datasets)
library(ggplot2)


# Define server logic required to plot various variables 
shinyServer(function(input, output) {
        
        # Compute the forumla text in a reactive expression 
        formulaText <- reactive({
                paste(input$variable)
        })
        
        # Return the formula text for printing as a caption
        output$caption <- renderText({
                formulaText()
        })
        
        output$definition <- renderText({
                
                if (input$variable == "Histogram")
                { "A histogram is a graphical representation of the distribution of numerical data. It is an estimate of the probability distribution of a continuous variable (quantitative variable) and was first introduced by Karl Pearson"}
                
                else if (input$variable == "Boxplot")
                {
                  "In descriptive statistics, a box plot or boxplot is a convenient way of graphically depicting groups of numerical data through their quartiles. Box plots may also have lines extending vertically from the boxes (whiskers) indicating variability outside the upper and lower quartiles."      
                }
                
                else if (input$variable == "Scatterplot")
                {
                  "A scatterplot is a useful summary of a set of bivariate data (two variables), usually drawn before working out a linear correlation coefficient or fitting a regression line."      
                }
        })
        
        output$code <- renderText({
                
                if (input$variable == "Histogram")
                { "hist(airquality$Ozone, col = 'green')"}
                
                else if (input$variable == "Boxplot")
                {
                        "boxplot(airquality$Ozone, col = 'blue')"      
                }
                
                else if (input$variable == "Scatterplot")
                {
                        "with(airquality, plot(Ozone, Temp, col = Month))
                        abline(h = 12, lwd = 2, lty = 2)"      
                }
        })
        
        # Generate a plot of the requested variable  
        
        output$expPlot <- renderPlot({
                if (input$variable == "Histogram")
                {hist(airquality$Ozone, col = "green")}
                
                 if (input$variable == "Boxplot")
                {boxplot(airquality$Ozone, col = "blue")}
                
                 if (input$variable == "Scatterplot")
                {with(airquality, plot(Ozone, Temp, col = Month))
                        abline(h = 12, lwd = 2, lty = 2)}
                
        })
})