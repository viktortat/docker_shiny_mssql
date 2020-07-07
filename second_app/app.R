library(shiny)
library(data.table)
library(odbc)

con <- dbConnect(odbc(), Driver = "SQL Server", Server = "sql-server", Database = "app_db", UID = "SA",PWD = "MyPassword123!", Port = 1434)

iris <- as.data.table(dbGetQuery(con, "select * from iris"))

# iris[, Sepal_Length:=as.numeric(Sepal_Length)][, Sepal_Width:=as.numeric(Sepal_Width)]
# iris[, Petal_Length:=as.numeric(Petal_Length)][, Petal_Width:=as.numeric(Petal_Width)]

print(iris)

names(iris) <- gsub("_", "\\.", names(iris))

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Iris Data App"),

    # Sidebar 
    sidebarLayout(
        sidebarPanel(
            selectInput("select", label = h3("Select Species"), 
                        choices = list("setosa" = "setosa", "versicolor" = "versicolor", "virginica" = "virginica"), 
                        selected = 1)
        ),

        # Show plots of the generated distributions
        mainPanel(
           plotOutput("sep.length"),
           plotOutput("sep.width"),
           plotOutput("pet.length"),
           plotOutput("pet.width")
        )
    )
)

# Define server logic required to draw histograms
server <- function(input, output) {

    output$sep.length <- renderPlot({
        
       # draw the histogram 
        hist(iris[Species==input$select, Sepal.Length], col = 'darkgray', border = 'white', main="Sepal Length", xlab="cm")
    })
    
    output$sep.width <- renderPlot({
        
        # draw the histogram 
        hist(iris[Species==input$select, Sepal.Width], col = 'darkgray', border = 'white', main="Sepal Width", xlab="cm")
    })
    
    output$pet.length <- renderPlot({
        
        # draw the histogram 
        hist(iris[Species==input$select, Petal.Length], col = 'darkgray', border = 'white', main="Petal Length", xlab="cm")
    })
    
    output$pet.width <- renderPlot({
        
        # draw the histogram 
        hist(iris[Species==input$select, Petal.Width], col = 'darkgray', border = 'white', main="Petal Width", xlab="cm")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
