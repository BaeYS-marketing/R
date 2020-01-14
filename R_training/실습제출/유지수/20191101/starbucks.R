library(XML)
library(httr)
library(rvest)
install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445,
                      browserName = "chrome")
remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")

Sys.sleep(5)
seoul <- remDr$findElement(using = "css", '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
seoul$clickElement()
Sys.sleep(5)
seoul_all <- remDr$findElement(using="css",'#mCSB_2_container > ul > li:nth-child(1) > a')
seoul_all$clickElement()

Sys.sleep(5)
shopnames <- NULL
for (i in 1:503){
shopcss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
shopnamecss <- remDr$findElements(using = "css", shopcss)
shopname <- sapply(shopnamecss, function(x){x$getElementText()})
shopnames <- c(shopnames,unlist(shopname))
if (i%%3==0){
  remDr$executeScript(
    "var su=arguments[0]; var dom = document.querySelectorAll(
    '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
}
}

shopnames <- list(shopname=shopnames)
write.csv(shopnames,"starbucks.csv")

