remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
remDr$setWindowSize(1280,1024, winHand = "current")
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
Sys.sleep(5) #몇개의 시도가 있는지 알아냄
templist<-remDr$findElement(using='css', '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul')
sidoL=unlist(strsplit(gsub("\n","spl",templist$getElementText()),"spl"))
templist=NULL
cat(length(sidoL),"개의 지역에 대해 작업합니다.\n")
starbucksSum =NULL#전체 정보를 담을 변수 초기화
for (i in 1:length(sidoL)){ #전체 지역갯수에 대해 반복 지역, 전체 누르기 반복
  cat(length(sidoL),"개의 지역 중",i,"번 째 지역을 작업합니다.\n")
  starbucks =NULL
  brNameText = NULL
  brAddrText = NULL
  latitude = NULL
  longitude = NULL
#지역 클릭
  css<-paste0('#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(',i,') > a')
  templist<-remDr$findElement(using='css', css)
  templist$clickElement()
#전체클릭
  Sys.sleep(5)
  try({#마지막의 세종시의 경우 전체 항목 없음
    css='#mCSB_2_container > ul > li:nth-child(1) > a'
    templist<-remDr$findElement(using='css',css)
    templist$clickElement()
})
  Sys.sleep(5)
#매장 수 알아내기
  templist<-remDr$findElement(using='css', '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap')
  shopSum=gsub("[^[:digit:]]","",templist$getElementText())
  cat(sidoL[i],"의 매장 갯수는 ",shopSum,"개 입니다.\n",sep="")
  for(i in 1:shopSum){ #스크래핑
    css=paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
    templist<-remDr$findElements(using = 'css selector',css)
    brNameText[i]<-sapply(templist,function(x){x$getElementText()})
    css=paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
    templist<-remDr$findElements(using = 'css selector',css)
    addNum<-sapply(templist,function(x){x$getElementText()})
    addNum<-gsub("\n","spl",addNum)
    addNum<-strsplit(addNum,"spl")
    brAddrText<-rbind(brAddrText,c(addNum[[1]][1],addNum[[1]][2]))
    css=paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
    templist<-remDr$findElements(using = 'css selector',css)
    latitude[i]<-sapply(templist,function(x){x$getElementAttribute('data-lat')})
    longitude[i]<-sapply(templist,function(x){x$getElementAttribute('data-long')})
    try({#매장 수가 정확히 3의 배수인 경우 스크롤 마지막에 오류가 남
      if(i%%3==0){#오류가 난 경우에도 최하단 까지 스크롤 되어 있음
        remDr$executeScript(
          "var su=arguments[0]; var dom=document.querySelectorAll(
          '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
        }
      }
      )
    shopname<-unlist(brNameText)
    address<-brAddrText[,1]
    phone<-brAddrText[,2]
    starbucks=cbind(shopname,unlist(latitude),unlist(longitude),address,phone)
}
 starbucksSum = rbind(starbucksSum,starbucks)
 remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
 remDr$executeScript("scrollBy(0, -8400)")#최상단으로 스크롤
 Sys.sleep(5)
}
cat("총",length(starbucksSum[,1]),"개의 매장 정보를 수집하였습니다.")
write.csv(starbucksSum,"starbucksTotal.csv")