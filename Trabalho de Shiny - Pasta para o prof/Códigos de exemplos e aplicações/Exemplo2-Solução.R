library(shiny)

ui <- fluidPage(
    
    titlePanel("Exemplo 2"),
    
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
            plotOutput("normplot"),
            verbatimTextOutput("sumarizar")
        )
    )
)

## Código ajustado com o reactive()

server <- function(input, output) {
    
    x <- reactive({(rnorm(input$numeros))
    })
    ##Uso do render()
    output$normplot <- renderPlot({ 
        
    
        hist(x(), col = 'darkgray', border = 'white', main = input$titulo)
    })
    
    output$sumarizar <-
        renderPrint({
            summary(x())
        })
}

shinyApp(ui = ui, server = server)
