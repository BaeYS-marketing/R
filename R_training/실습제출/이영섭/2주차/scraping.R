library(dplyr)


url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)

#문제 1 
text %>% html_nodes("h1") %>% html_text()

# nodes1 <- html_nodes(text, "h1")
# title1 <- html_text(nodes1)
# title1

#문제 2
text %>% html_nodes("a") %>% html_text()
text %>% html_nodes("a") %>% html_attr("href")

# nodes2 <- html_nodes(text, "a")
# title2 <- html_text(nodes2)
# attr2 <- html_attr(nodes2, "href")
# title2
# attr2

#문제 3
text %>% html_nodes("img") %>% html_attr("src")

# nodes3 <- html_nodes(text, "img")
# attr3 <- html_attr(nodes3,"src")
# attr3

#문제 4
text %>% html_nodes("h2:nth-of-type(1)") %>% html_text()

# nodes4 <- html_nodes(text,"h2:nth-of-type(1)")
# title4 <- html_text(nodes4)
# title4

#문제 5
text %>% html_nodes("ul > li[style$='green']") %>% html_text()

# nodes5 <- html_nodes(text,"ul > li[style$=green]")
# title5 <- html_text(nodes5)
# title5


#문제 6
text %>% html_nodes("h2:nth-of-type(2)") %>% html_text()

# nodes6 <- html_nodes(text,"h2:nth-of-type(2)")
# title6 <- html_text(nodes6)
# title6

#문제 7
text %>% html_nodes("ol > *") %>% html_text()

# nodes7 <- html_nodes(text, "ol > *")
# title7 <- html_text(nodes7)
# title7

#문제 8
text %>% html_nodes("table *") %>% html_text()

# nodes8 <- html_nodes(text,"table *")
# title8 <- html_text(nodes8)
# title8

#문제 9
text %>% html_nodes("tr[class=name]") %>% html_text()

text %>% html_nodes("tr.name") %>% html_text()

# nodes9 <- html_nodes(text, "tr")
# title9 <- html_text(nodes9)
# attr9 <- html_attr(nodes9, "class")
# title9[which(attr9=="name")]

#문제 10
text %>% html_nodes("td#target") %>% html_text()

# nodes10 <- html_nodes(text, "td")
# title10 <- html_text(nodes10)
# attr10 <- html_attr(nodes10, "id")
# title10[which(attr10=="target")]
