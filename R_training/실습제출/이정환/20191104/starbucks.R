library(httr)
library(rvest)
library(XML)
library(RSelenium)

remDr = remoteDriver(remoteServerAddr = "localhost",
                     port = 4445,
                     browserName = "chrome")
remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")

seoul = remDr$findElement(using = "css", "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a[data-sidocd='01']")
seoul$clickElement()
all_seoul = remDr$findElement(using = "css", "#mCSB_2_container > ul > li:nth-child(1) > a")
all_seoul$clickElement()

shopname = NULL
lat = NULL
lng = NULL
addr = NULL
telephone = NULL

for (i in 1:503) {
  name_css = paste0("#mCSB_3_container > ul > li:nth-child(", i, ") > strong")
  name_tag = remDr$findElements(using = "css", name_css)
  name = sapply(name_tag, function(x){x$getElementText()})
  shopname[i] = unlist(name)
  
  latlong_css = paste0("#mCSB_3_container > ul > li:nth-child(", i, ")")
  latlong_tag = remDr$findElements(using = "css", latlong_css)
  lat_ = sapply(latlong_tag, function(x){x$getElementAttribute('data-lat')})
  lat[i] = unlist(lat_)
  long = sapply(latlong_tag, function(x){x$getElementAttribute('data-long')})
  lng[i] = unlist(long)
  
  addtel_css = paste0("#mCSB_3_container > ul > li:nth-child(", i, ") > p")
  addtel_tag = remDr$findElements(using = "css", addtel_css)
  addtel = sapply(addtel_tag, function(x){x$getElementText()})
  addtel_split = strsplit(unlist(addtel), "\n")
  addr[i] = addtel_split[[1]][1]
  telephone[i] = addtel_split[[1]][2]
  
  if(i%%3 == 0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
  Sys.sleep(0.3)
}
shopname
lat
lng
addr
telephone

starbucks = data.frame(shopname, lat, lng, addr, telephone, stringsAsFactors = F)
head(starbucks)
str(starbucks)

write.csv(starbucks, "starbucks.csv", row.names = F)
