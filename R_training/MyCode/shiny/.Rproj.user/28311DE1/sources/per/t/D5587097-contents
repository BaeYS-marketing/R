#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


'ui 사용자한테 입력받고 서버한테 요청하고 서버의 응답을 사용자에게  보여주는 역활 (클라이언트)
server 처리 



Web = server +client
      서버 : 회사나 기관이 운영 
      클라이언트 = 브라우저


샤이니 웹에서는 ui.R 이 클라이언트
       서버는 server.R
            
       클라이언트 + 서버는  app.R'



#install.packages("shiny")


'html , css, javaScript 가 사용되지 않았는데 
 R코드만으로 웹프로그래밍을 만듬. 이런 추세다.

서버부터 띄우기 때문에 refresh해줘야한다. 
Listening on http://127.0.0.1:7964
                   내 HOST   : 포트번호'



library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
