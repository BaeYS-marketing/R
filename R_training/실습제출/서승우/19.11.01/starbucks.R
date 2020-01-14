#Starbucks 매장 웹크롤링
remDr$open()
url<-'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr$navigate(url)
city<-remDr$findElement(using='css selector','#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
city$clickElement()
gu<-remDr$findElement(using='css selector','#mCSB_2_container > ul > li:nth-child(1) > a')
gu$clickElement()

shopname<-NULL
for(i in 1:503){
  name<-paste("#mCSB_3_container > ul > li:nth-child(", i, ") > strong",sep="")
  storeName<-remDr$findElements(using='css selector',name)
  Name<-sapply(storeName, function(x){x$getElementText()})
  shopname <- c(shopname, unlist(Name))
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}

addr<-NULL
for(i in 1:503){
  Addr<-paste("#mCSB_3_container > ul > li:nth-child(", i, ") > p",sep="")
  storeaddr<-remDr$findElements(using='css selector',Addr)
  storeaddr2<-sapply(storeaddr, function(x){x$getElementText()})
  addr <- c(addr, unlist(storeaddr2))
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}


phone<-NULL
for(i in 1:503){
  phone<-paste("#mCSB_3_container > ul > li:nth-child(", i, ") > p",sep="")
  storeaddr<-remDr$findElements(using='css selector',Addr)
  storeaddr2<-sapply(storeaddr, function(x){x$getElementText()})
  addr <- c(addr, unlist(storeaddr2))
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}


