page <- read_html("http://unico2013.dothome.co.kr/crawling/exercise_bs.html")

#ans1
pre_ans1 <- html_nodes(page, "h1")
ans1 <- html_text(pre_ans1)

#ans2
pre_ans2 <- html_nodes(page, "a")
ans2.1 <- html_text(pre_ans2) 
ans2.2 <- html_attr(pre_ans2, "href")

#ans3
pre_ans3 <- html_nodes(page, "img")
ans3 <- html_attr(pre_ans3, "src")

#ans4
pre_ans4 <- html_nodes(page, "h2:nth-of-type(1)")
ans4 <- html_text(pre_ans4)

#ans5
pre_ans5 <- html_nodes(page, "ul")
pre_ans5.1 <- html_nodes(pre_ans5, "li")
pre_ans5.2 <- html_attr(pre_ans5.1, "style")
which(pre_ans5.2=="color:green")
pre_ans5.3 <- html_nodes(pre_ans5, "li:nth-of-type(3)")
ans5 <- html_text(pre_ans5.3)

pre5 <- html_nodes(page, "ul > [style$=green]")

#ans6
pre_ans6 <- html_nodes(page, "h2:nth-of-type(2)")
ans6 <- html_text(pre_ans6)

#ans7
pre_ans7 <- html_nodes(page, "ol > *")
ans7 <- html_text(pre_ans7)

#ans8
pre_ans8 <- html_nodes(page, "table *")
ans8 <- html_text(pre_ans8)

#ans9
pre_ans9 <- html_nodes(page, "tr[class=name]")
pre_ans9 <- html_nodes(page, "tr.name")
ans9 <- html_text(pre_ans9)

#ans10
pre_ans10 <- html_nodes(page, "td#target")
ans10 <- html_text(pre_ans10)
#id선택할때는 태그이름을 생략함 왜냐하면 ID는 유니크한 값이기 때문에


#태그명[속성명]  -> 이 속성명을 가지고있는 애들 뽑아라
#태그명[속성명=속성값] -> 속성과 속성값을 가지고 있는 애들 뽑아라
#태그명[속성명^=속성값] -> 속성값으로 시작하는 애들 뽑아라
#태그명[송성명$=속성값] -> 속성값으로 끝나는 애들 뽑아라