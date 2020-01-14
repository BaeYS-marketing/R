library(RSelenium)

remDr$open()
remDr$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?%20cid=-204")

delpop = remDr$findElement(using='css selector', 'div.IconBox.IconBox--checkIn.IconBox--focused')
delpop$clickElement()

remDr$executeScript("scrollBy(0, 1000)")
review = remDr$findElement(using='css selector', '#navbar > div > ul > li:nth-child(3) > span')
review$clickElement()
remDr$executeScript("scrollBy(0, 100)")

ReviewNodes=remDr$findElements(using='css selector', 'div.Review-comment-body > p.Review-comment-bodyText')
Reviewtext = sapply(ReviewNodes,function(x){x$getElementText()})

repeat{
  nextbutton = remDr$findElement(using="css selector", '#reviewSection > div:nth-child(4) > div > span:nth-child(3)')
  if(length(nextbutton) == 0)   break;
  nextbutton$clickElement()
  Sys.sleep(1)
  ReviewNodes=remDr$findElements(using='css selector', 'div.Review-comment-body > p.Review-comment-bodyText')
  Reviewtext2 = sapply(ReviewNodes,function(x){x$getElementText()})
  Reviewtext = list(Reviewtext, Reviewtext2)
}

write(unlist(Reviewtext),"c:/Rstudy/hotel.txt")
cat(length(unlist(Reviewtext)), "개의 댓글 추출")