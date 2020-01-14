remDr$open()
remDr$setWindowSize(1024,768, winHand = "current")
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
Sys.sleep(5)
seoul<-remDr$findElement(using='css',
                         '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
seoul$clickElement()
entire<-remDr$findElement(using='css',
                         '#mCSB_2_container > ul > li:nth-child(1) > a')
entire$clickElement()
brNameText = NULL
brAddrText = NULL
latitude = NULL
longitude = NULL
templist<-remDr$findElement(using='css', '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap')
shopSum=gsub("[^[:digit:]]","",templist$getElementText())
cat("매장 갯수는 ",shopSum,"개 입니다.\n",sep="")
for(i in 1:shopSum){
  css=paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
  brName<-remDr$findElements(using = 'css selector',css)
  brNameText[i]<-sapply(brName,function(x){x$getElementText()})
  css=paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
  brAddr<-remDr$findElements(using = 'css selector',css)
  addNum<-sapply(brAddr,function(x){x$getElementText()})
  addNum<-gsub("\n","spl",addNum)
  addNum<-gsub(",","",addNum)
  addNum<-strsplit(addNum,"spl")
  brAddrText<-rbind(brAddrText,c(addNum[[1]][1],addNum[[1]][2]))
  css=paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
  brLa<-remDr$findElements(using = 'css selector',css)
  latitude[i]<-sapply(brLa,function(x){x$getElementAttribute('data-lat')})
  longitude[i]<-sapply(brLa,function(x){x$getElementAttribute('data-long')})
    if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))}
}
shopname<-unlist(brNameText)
address<-brAddrText[,1]
phone<-brAddrText[,2]
starbucks<-cbind(shopname,latitude,longitude,address,phone)
write.csv(starbucks,"starbucks.csv")