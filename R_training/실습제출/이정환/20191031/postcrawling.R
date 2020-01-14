# POST방식으로 요청
page = POST("http://unico2013.dothome.co.kr/crawling/post.php",
            encode = "form",
            body = list(name="R", age="27"))

# HTML 불러오기
text = read_html(page)

# h1태그 노드 불러오기
nodes = html_nodes(text, "h1")

# h1태그 content 가져오기
R27 = html_text(nodes)
R27
