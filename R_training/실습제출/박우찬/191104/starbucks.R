library(RSelenium)
remDr = remoteDriver(remoteServerAddr = 'localhost', port = 4445,
                     browserName = 'chrome')


remDr$open()
remDr$navigate('https://www.istarbucks.co.kr/store/store_map.do?disp=locale')

# 서울지역
Seoul_Click = remDr$findElement(using = 'css', '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
Seoul_Click$clickElement()

# 전체클릭릭
Whole_Click = remDr$findElement(using = 'css', '#mCSB_2_container > ul > li:nth-child(1) > a')
Whole_Click$clickElement()

# 추출

count = remDr$findElements('css selector','#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap > span')  
x = sapply(count, function(x){x$getElementText()})
x = as.numeric(x)
shop = NULL
addr = NULL
phone = NULL
lat = NULL
long = NULL
y1 = NULL
y2 = NULL
y3 = NULL
y4 = NULL
y5 = NULL
for(i in 1:x){
  # 매장명
  shopname = remDr$findElements('css selector',paste('#mCSB_3_container > ul > li:nth-child(',i,') > strong'))
  y1 = sapply(shopname, function(x){x$getElementText()})
  shop = c(shop,y1)
  
  # 주소, 전화번호
  addrname = remDr$findElements('css selector',paste('#mCSB_3_container > ul > li:nth-child(',i,')> p'))
  y2 = sapply(addrname, function(x){x$getElementText()})
  y3 = unlist(strsplit(as.character(y2),'\n',perl = TRUE))
  addr = c(addr,y3[1])
  addr = gsub('\n',"",addr)
  phone = c(phone,y3[2])
  ?strsplit
  
  
  absolute = remDr$findElements('css selector',paste0('#mCSB_3_container > ul > li:nth-child(',i,')'))
  y4 = sapply(absolute, function(x){x$getElementAttribute("data-lat")})
  y5 = sapply(absolute, function(x){x$getElementAttribute("data-long")})
  lat = c(lat,y4)
  long = c(long,y5)
  
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}
dd = list(addr)
ff = list(phone)
result = cbind(shop,lat,long,addr,phone)
write.csv(result,'starbuck211s.csv')

rm(list=ls())
