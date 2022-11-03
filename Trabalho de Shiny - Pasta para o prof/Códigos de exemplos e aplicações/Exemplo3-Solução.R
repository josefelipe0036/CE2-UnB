library(shiny)


ui <- fluidPage(
    
    titlePanel("Exemplo 3"),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("numeros",
                        "Quantidade de números:",
                        min = 1,
                        max = 100,
                        value = 50),
            
            textInput(inputId = "titulo",
                      label = " Mude o título do seu gráfico",
                      value = "Histograma Exemplo"),
            
        ),
        
        mainPanel(
            plotOutput("normplot")
        )
    )
)

## Código ajustado com o isolate()
server <- function(input, output) {
    
    output$normplot <- renderPlot({
        x<-rnorm(input$numeros)
        
        ##Uso do isolate
        
        title <- isolate(input$titulo) 
        
        hist(x, col = 'darkgray', border = 'white', main = title)
        
    })
}

shinyApp(ui, server)