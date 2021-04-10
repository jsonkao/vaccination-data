from bs4 import BeautifulSoup as bs
import sys

with open(sys.argv[1]) as f:
    data = bs(f.read(), 'html.parser').find("script", {"id": "dvz-data-cave"})
    print(data.next)
