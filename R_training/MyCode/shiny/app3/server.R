library(shiny)
shinyServer(function(input, output){
        sliderValues <- reactive({  
                #클라인트의 aaa가 바뀔 때 마다 시행하겠다. 아래 내용의 함수 리턴 
                data.frame(
                        Parameter="BBB",
                        Value = as.character(input$aaa)
                ) 
                
        })
        output$values <- renderTable({
                sliderValues()
        })
        # output$values <- renderPrint({
         # sliderValues()
        # })
})