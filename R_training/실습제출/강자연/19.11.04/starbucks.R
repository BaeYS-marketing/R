
#스타벅스 동적 크롤링
#0. 셀레늄기동
#1.
library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale") 
Sys.sleep(3)
seoul<-remDr$findElement(using="css", "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a")
seoul$clickElement()
Sys.sleep(3)
seoul<-remDr$findElement(using="css", "#mCSB_2_container > ul > li:nth-child(1) > a")
seoul$clickElement()
Sys.sleep(5)
Names=NULL
Ads=NULL
lats=NULL
lngs=NULL
#container > div > form > fieldset > div > section > article.find_store_cont > article
for(i in 1:503){

  css1=paste0('#mCSB_3_container > ul > li:nth-child(',i,') > strong')
  css2=paste0('#mCSB_3_container > ul > li:nth-child(',i,') > p')
  lat=paste0('#mCSB_3_container > ul > li:nth-child(',i,')')
  lng=paste0('#mCSB_3_container > ul > li:nth-child(',i,')')
  
  firstnames<-remDr$findElements(using ='css',css1)
  Ad<-remDr$findElements(using ='css',css2)
  lat<-remDr$findElements(using ='css',lat)
  lng<-remDr$findElements(using ='css',lng)
  
  
  Name<-sapply(firstnames, function(x){x$getElementText()})
  Ad<-sapply(Ad, function(x){x$getElementText()})
  lat<-sapply(lat, function(x){x$getElementAttribute('data-lat')})
  lng<-sapply(lng, function(x){x$getElementAttribute('data-long')})
  
  
  Name=as.matrix(Name)
  Names=rbind(Names, Name)
  
  Ad=as.matrix(Ad)
  Ads=rbind(Ads, Ad)
  
  
  lat=as.matrix(lat)
  lats=rbind(lats, lat)
  
  lng=as.matrix(lng)
  lngs=rbind(lngs, lng)
  
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}
result1=paste("매장명=",Names)
result2=paste("주소와 전화번호=",Ads)
result3=paste("위도=",lats)
result4=paste("경도=",lngs)

result=cbind(result1,result2,result3,result4)
write.table(result,"starbucks.txt")  


getwd()






