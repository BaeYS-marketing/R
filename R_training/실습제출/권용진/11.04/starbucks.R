install.packages("RSelenium")
library(RSelenium)

remDr = remoteDriver(remoteServerAddr = "localhost", port = 4445,
                     browserName = "chrome") 
#localhost 나의 컴퓨터를 의미 + 접속 처리

remDr$open()
remDr$setWindowSize(1280,1024)
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
Sys.sleep(1)
sido = remDr$findElement(using='css selector', '#container > div > form > fieldset > div > section > article.find_store_cont > article > header.loca_search > h3 > a')
sido$clickElement()
Sys.sleep(1)
seoul = remDr$findElement(using='css selector', '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
seoul$clickElement()
Sys.sleep(1)
all = remDr$findElement(using='css selector', '#mCSB_2_container > ul > li:nth-child(1) > a')
all$clickElement()
Sys.sleep(1)

shopname=NULL
addrename=NULL
phonename=NULL

for(i in 1:503) {
    css = paste('#mCSB_3_container > ul > li:nth-child(',i,') >  strong', sep='')
    name = remDr$findElements(using='css selector',  css)
    shopname= sapply(name,function(x){x$getElementText()})
    shopnames = c(addr,unlist(addrename))
    
    if(i%%3==0){
      remDr$executeScript(
        "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
    }
}

addr <- NULL    
for(i in 1:503) {    
    css2 = paste('#mCSB_3_container > ul > li:nth-child(',i,') >  p', sep='')
    addre = remDr$findElements(using='css selector',  css2)
    addrename = sapply(addre,function(x){x$getElementText()})
    addr = c(addr,unlist(addrename))
    
    if(i%%3==0){
      remDr$executeScript(
        "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
    }
}
modadd <- strsplit(addr,"\n")
modaddr <- unlist(modadd)

addrs<- NULL
addr<- NULL
for(i in 1:1006){
  if (i%%2==1){
    addr <- modaddr[i]
    addrs <- c(addrs,addr)
  }
}

phones<- NULL
phone<- NULL
for(i in 1:1006){
  if (i%%2==0){
    phone <- modaddr[i]
    phones <- c(phones,phone)
  }
}

starbucks <- list(shopname=shopnames,address=addrs,phone=phones)
write.csv(starbucks, "c://Rstudy/starbucks2.csv")