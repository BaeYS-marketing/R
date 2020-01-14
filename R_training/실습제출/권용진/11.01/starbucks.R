library(RSelenium)
remDr$open()
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

for(i in 1:503) {
    css = paste("#mCSB_3_container > ul > li:nth-child(",i,") >  strong", sep='')
    name = remDr$findElements(using='css selector',  css)
    shopname[i] = sapply(name,function(x){x$getElementText()})
    if(i%%3==0){
      remDr$executeScript(
        "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
    }
  }
  