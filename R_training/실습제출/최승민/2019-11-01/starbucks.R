library(RSelenium)
library(httr)
library(rvest)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr$navigate(url)

laterAction<-remDr$findElement(using='css',
                               '#container article.find_store_cont li:nth-child(1) > a')
if(length(laterAction) != 0){
  laterAction$clickElement()
} 

laterAction<-remDr$findElement(using='css',
                               '#mCSB_2_container > ul > li:nth-child(1) > a')
if(length(laterAction) != 0){
  laterAction$clickElement()
} 

market_L <- NULL
market_L2 <- NULL
market_L3 <- NULL
market_L4 <- NULL
addr <- NULL
phone <- NULL

for(i in 1:503){
  
  market_tt <- paste("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
  market_ttl <- remDr$findElements(using = "css", market_tt)
  market_list <- sapply(market_ttl, function(x){x$getElementText()})
  market_L <- c(market_L, unlist(market_list))
  
  
  p <- paste0("#mCSB_3_container > ul > li:nth-child(", i, ") > p")
  doms4 <- remDr$findElements(using = "css", p)
  addrtele <- sapply(doms4, function(x){x$getElementText()})
  
  addrtele <- strsplit(unlist(addrtele), split = "\n")
  addr <- addrtele[[1]][1]
  print(addr)
  phone <- addrtele[[1]][2]
  print(phone)
  
  market_la <- paste("#mCSB_3_container > ul > li:nth-child(",i,")")
  market_lat <- remDr$findElements(using = "css", market_la)
  market_latt <- sapply(market_lat, function(x){x$getElementAttribute("data-lat")})
  market_L3 <- c(market_L3, unlist(market_latt))

  market_al <- paste("#mCSB_3_container > ul > li:nth-child(",i,")")
  market_all <- remDr$findElements(using = "css", market_al)
  market_alll <- sapply(market_all, function(x){x$getElementAttribute("data-long")})
  market_L4 <- c(market_L4, unlist(market_alll))
 
  if(i%%3 == 0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
  Sys.sleep(0.3)
}

starbucks <- data.frame(title= market_L, phonenum = market_phone, address = market_addrr,
                        long = market_L4, lat = market_L3)

write.csv(starbucks, "starbucks.csv")



   