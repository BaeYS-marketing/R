library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")

seoul = remDr$findElement(using = "css", 'div.loca_step1_cont > ul > li:nth-child(1) > a')
seoul$clickElement()

all = remDr$findElement(using = "css", '#mCSB_2_container > ul > li:nth-child(1) > a')
all$clickElement()

starbuck = NULL
for(i in 1:503){
  a=paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
  NameNodes = remDr$findElements(using = "css", a)
  Name = sapply(NameNodes, function(x){x$getElementText()})
  
  datalat=paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
  NameNodes2 = remDr$findElements(using = "css", datalat)
  lat = sapply(NameNodes2, function(x){x$getElementAttribute("data-lat")})

  datalat=paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
  NameNodes3 = remDr$findElements(using = "css", datalat)
  lng = sapply(NameNodes3, function(x){x$getElementAttribute("data-long")})
  
  
  a1 = paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
  NameNodes2 = remDr$findElements(using = "css", a1)
  addres = sapply(NameNodes2, function(x){x$getElementText()})
  addres = strsplit(unlist(addres), "\n")
  addr = addres[[1]][1]
  telephone = addres[[1]][2]
  
  
  if(i%%3==0){
    remDr$executeScript("var su=arguments[0]; var dom = document.querySelectorAll(
                        '#mCSB_3_container > ul >li')[su]; dom.scrollIntoView();",list(i))
  }
  starbuck = c(starbuck, Name, lat, lng, addr, telephone)
}
write.csv(unlist(starbuck), "starbucks.csv")
