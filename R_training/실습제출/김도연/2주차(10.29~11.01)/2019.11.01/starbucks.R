library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")

seoul = remDr$findElement(using = "css", 'div.loca_step1_cont > ul > li:nth-child(1) > a')
seoul$clickElement()

all = remDr$findElement(using = "css", '#mCSB_2_container > ul > li:nth-child(1) > a')
all$clickElement()
b=0
for(i in 1:503){
  a=paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
  NameNodes = remDr$findElements(using = "css", a)
  Name = sapply(NameNodes, function(x){x$getElementText()})
  b = c(b,Name)
  if(i%%3==0){
    remDr$executeScript("var su=arguments[0]; var dom = document.querySelectorAll(
                        '#mCSB_3_container > ul >li')[su]; dom.scrollIntoView();",list(i))
  }
}
write.csv(b, "starbucks.csv")
