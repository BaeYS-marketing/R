# url 요청
install.packages("RSelenium")
library(RSelenium)
?RSelenium
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr$navigate(url)

# 서울지역 클릭
seoul <- remDr$findElement(using = "css", "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a")
seoul$clickElement()

# 전체 클릭
all <- remDr$findElement(using = "css", "#mCSB_2_container > ul > li:nth-child(1) > a")
all$clickElement()

Sys.sleep(3)

# 1:503
starbucks <- NULL
for(i in 1:503){
  # 매장명(shopname)
  name <- paste0("#mCSB_3_container > ul > li:nth-child(", i, ") > strong")
  doms <- remDr$findElements(using ="css", name)
  shopname <- sapply(doms, function(x){x$getElementText()})
  print(shopname)
  
  # 위도(lat)
  datalat <- paste0("#mCSB_3_container > ul > li:nth-child(", i, ")")
  doms2 <- remDr$findElements(using = "css", datalat)
  lat <- sapply(doms2, function(x){x$getElementAttribute("data-lat")})
  print(lat)
  
  # 경도(lng)
  datalat <- paste0("#mCSB_3_container > ul > li:nth-child(", i, ")")
  doms3 <- remDr$findElements(using = "css", datalat)
  lng <- sapply(doms3, function(x){x$getElementAttribute("data-long")})
  print(lng)
  
  # 주소(addr) 그리고 전화번호(telephone)
  p <- paste0("#mCSB_3_container > ul > li:nth-child(", i, ") > p")
  doms4 <- remDr$findElements(using = "css", p)
  addrtele <- sapply(doms4, function(x){x$getElementText()})
  # strsplit() 함수 활용: 전화번호하고 주소 분리하기
  addrtele <- strsplit(unlist(addrtele), split = "\n")
  addr <- addrtele[[1]][1]
  print(addr)
  telephone <- addrtele[[1]][2]
  print(telephone)
  
  if(i %% 3 == 0){
    remDr$executeScript(
      "var su = arguments[0]; var dom = document.querySelectorAll(
      '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();", list(i))
  }
  
  starbucks <- c(starbucks, shopname, lat, lng, addr, telephone)
}

write.csv(unlist(starbucks), "starbucks.csv")
