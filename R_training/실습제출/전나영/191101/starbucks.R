# url 요청
library(RSelenium)
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

## Sys.sleep(3)

# 1:503
num = 0
for(i in 1:503){
  # 매장명(shopname)
  name <- paste0("#mCSB_3_container > ul > li:nth-child(", i, ") > strong")
  doms <- remDr$findElements(using ="css", name)
  shopname <- sapply(doms, function(x){x$getElementText()})
  print(shopname)
  num <- c(num, shopname)
    
  if(i %% 3 == 0){
    remDr$executeScript(
      "var su = arguments[0]; var dom = document.querySelectorAll(
      '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();", list(i))
  }
}

write(unlist(num), "starbucks.txt")
