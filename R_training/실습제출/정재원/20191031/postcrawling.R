url='http://unico2013.dothome.co.kr/crawling/post.php'
unico = POST(url,
            encode='form', body=list(name='R',age='27'))
title = html_nodes(read_html(unico), 'h1')
title = html_text(title)
title