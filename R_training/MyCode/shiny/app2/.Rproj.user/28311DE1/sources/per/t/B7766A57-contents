library(shiny)

shinyServer(function(input, output){
        output$unico<- renderPrint({  #서버가 보여주는 것 ;랜더링
                dataset <- iris[-5]
                summary(dataset)
        })
        
})
