import time
import requests
from bs4 import BeautifulSoup
def getInfo(durl):
    r1=requests.get(durl)
    dom1=BeautifulSoup(r1.text,"html.parser")
    title = dom1.find('h1').text
    print(title)
    temp1=[]
    temp1.append(title)
    '{}\n'.format(temp1)
    #drr = dom1.find('div', {'id': 'news_body_id'})
    #ps = drr.find_all('div',{'class':'par'})
    #for p in ps:
    #    t2 = p.text.strip()
    #    temp1.append(t2)
    #contents = ' '.join(temp1)

    with open('data/itchosuntitle4.txt', 'a', encoding='utf-8') as f:
         f.write('{}\n'.format(temp1))
#-------------------------------------------------------------------------
url='http://it.chosun.com/'
recvd=requests.get(url)
# print(recvd)
whole_source = ""
for page_number in range(211, 275+1):
	URL = 'http://it.chosun.com/svc/list_in/list.html?pn=' + str(page_number)
	response = requests.get(URL)
	whole_source = whole_source + response.text
dom = BeautifulSoup(whole_source, 'html.parser')
div1=dom.select('div.txt_wrap')
#print(div1)
for d in div1:
    durl = d.find('a')['href']
    # print(durl)
    result=getInfo(durl)





