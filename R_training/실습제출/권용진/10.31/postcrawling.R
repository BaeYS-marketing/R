library(httr)
site = POST('http://unico2013.dothome.co.kr/crawling/post.php',
            encode='form', body=list(name='R', age='27'))
result1 = html_nodes(read_html(site), 'body > h1')
result1 = html_text(result1)
