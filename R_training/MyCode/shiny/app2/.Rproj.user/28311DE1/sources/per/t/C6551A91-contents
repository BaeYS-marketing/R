library(shiny)

shinyUI(fluidPage(
        titlePanel("제목 패널"),
        sidebarPanel("측면 패널"),
        mainPanel(
                h3("iris 요약통계량 결과"),
                verbatimTextOutput("unico")
                # textOutput("summary")
        )  
))


#서버가 만들어놓은 특정 결과를 ui에서 변수만 일치시켜주기만 하면 
#요청해결된다 : 굉장히 간단한 코딩이다. 