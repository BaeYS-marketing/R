site <- POST('http://unico2013.dothome.co.kr/crawling/post.php',
             encode='form', body=list(name='R', age='27'))
site
name <- html_nodes(read_html(site), 'h1')
name
name <- html_text(name)
name

# a태그나 url을 입력하는 방식으로 요청하면 get방식으로 입력되어 post방식의 요청을 할 수 없다.# 