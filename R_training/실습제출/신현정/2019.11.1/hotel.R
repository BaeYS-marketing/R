
Agoda <-NULL

repeat{read <- remDr$findElement(using = 'css','#reviewSection > div:nth-child(4) > div > span:nth-child(3) ')
read$clickElement()
Sys.sleep(2)

review <- remDr$findElements(using='css', 'p.Review-comment-bodyText')

text<- sapply(review,function(x){x$getElementText()})
Agoda <- c(Agoda, unlist(text))



if(length(read) ==0)
  break;

}
write(unlist(Agoda), "hotel.txt")