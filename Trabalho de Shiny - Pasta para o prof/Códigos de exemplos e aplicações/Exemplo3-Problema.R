library(shiny)

##Código Exemplo - Problema

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


## Código Exemplo - Problema

server <- function(input, output) {
    
    output$normplot <- renderPlot({
        
        x <- rnorm(input$numeros)
       
         title <- input$titulo
        
        hist(x, col = 'darkgray', border = 'white', main = title)
    })
    
}

shinyApp(ui = ui, server = server)