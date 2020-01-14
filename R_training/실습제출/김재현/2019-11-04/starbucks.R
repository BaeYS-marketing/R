remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")

Seoul <- remDr$findElement(using = "css","article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a")
Sys.sleep(1)
Seoul$clickElement()
Sys.sleep(3)
Seoul_all <- remDr$findElement(using = "css","#mCSB_2_container > ul > li:nth-child(1) > a")
Sys.sleep(1)
Seoul_all$clickElement()
Sys.sleep(3)

c <- NULL
adr_mat <- NULL
num_mat <- NULL

for(i in 1:503){
  addre <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
  a <- remDr$findElements(using = "css", addre)
  name <- sapply(a, function(x){x$getElementText()})
  c <- rbind(c,as.matrix(name))
  
  adr_num <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
  b <- remDr$findElements(using = "css", adr_num)
  adr_num_txt <- sapply(b, function(x){x$getElementText()})
  adr_num_txt <- unlist(adr_num_txt)
  adr_num_txt <- strsplit(adr_num_txt, "\n")
  adr_num_txt <- unlist(adr_num_txt)
  adr <- adr_num_txt[1]
  num <- adr_num_txt[2]
  adr <- as.matrix(adr)
  num <- as.matrix(num)
  adr_mat <- rbind(adr_mat, adr)
  num_mat <- rbind(num_mat, num)
  
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}

info_starbucks <- cbind(c, adr_mat, num_mat)
write.csv(info_starbucks,"starbucks.csv")
