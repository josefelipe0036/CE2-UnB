library(shiny)

ui <- fluidPage(
    
    titlePanel("Exemplo 1"),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "numeros",
                        label = "Quantidade de números:",
                        min = 1,
                        max = 100,
                        value = 50)
        ),
        
        mainPanel(
            plotOutput("normplot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$normplot <- renderPlot({
        
        x <- rnorm(input$numeros)
        
        hist(x,col = 'darkgray', border = 'white')
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
