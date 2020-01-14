#Starbucks 매장 웹크롤링
remDr$open()
url<-'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr$navigate(url)
city<-remDr$findElement(using='css selector','#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
city$clickElement()
gu<-remDr$findElement(using='css selector','#mCSB_2_container > ul > li:nth-child(1) > a')
gu$clickElement()


#매장명

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

#주소, 전화번호

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
write(addr, 'addr.txt')
a<-readLines('addr.txt')
addr<-a[seq(1, length(a), by=2)]
telephone<-a[seq(2, length(a), by=2)]               #?strsplit() 함수 : 전화번호하고 주소 분리하는 함수


#위도, 경도
loc<-NULL
for(i in 1:503){
  loca<-paste("#mCSB_3_container > ul > li:nth-child(", i, ")",sep="")
  loca<-remDr$findElements(using='css selector',loca)
  loca<-sapply(loca, function(x){x$getElementText()})
  loc <- c(loc, unlist(loca))
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}

data_lat<-NULL
data_long<-NULL
for(i in 1:503){
  lo<-paste("#mCSB_3_container > ul > li:nth-child(", i, ")",sep="")
  lo<-remDr$findElements(using='css', lo)
  lat<-sapply(lo, function(x){x$getElementAttribute('data-lat')})
  data_lat <- c(data_lat, unlist(lat))
  long<-sapply(lo, function(x){x$getElementAttribute('data-long')})
  data_long <- c(data_long, unlist(long))
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}

a<-data.frame(shopname,
              addr,
              telephone,
              data_lat,
              data_long)

write.csv(a, 'starbucks.csv')