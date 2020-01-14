#실습1 (2019-11-01)
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")
best <- remDr$findElements(using = "css", "div > div.u_cbox_text_wrap > span.u_cbox_contents")
reply <- sapply(best, function(x){x$getElementText()})
reply <- as.matrix(reply)
all_reply_click <- remDr$findElement(using = "css", "ul > li:nth-child(2) > a > span.u_cbox_sort_label")
all_reply_click$clickElement()
all1 <- remDr$findElements(using = "css", "div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span")
all1_reply <- sapply(all1, function(x){x$getElementText()})
all1_reply <- as.matrix(all1_reply)
reply <- rbind(reply, all1_reply)

for(i in 4:12){
  indi <- paste0("div.u_cbox_paginate > div > a:nth-child(",i,") > span")
  page <- remDr$findElement(using = "css", indi)
  page$clickElement()
  Sys.sleep(1)
  all <- remDr$findElements(using = "css", "div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span")
  all_reply <- sapply(all, function(x){x$getElementText()})
  all_reply <- as.matrix(all_reply)
  reply <- rbind(reply,all_reply)
}

write.table(reply,"webtoon1.txt")


