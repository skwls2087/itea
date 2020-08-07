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
    # div = dom1.select('div.node_body.cb')
    # for p in div:
    #     t2 = p.text.strip()
    #     temp1.append(t2)
    #print(temp1)
    #print('-' * 30)

    with open('data/kbenchtitle4.txt', 'a', encoding='utf-8') as f:
          f.write('{}\n'.format(temp1))
#-------------------------------------------------------------------------
url='https://kbench.com/'
recvd=requests.get(url)
# print(recvd)
whole_source = ""
for page_number in range(38, 50+1):
	URL = 'https://kbench.com/?q=taxonomy/term/92&page=' + str(page_number)
	response = requests.get(URL)
	whole_source = whole_source + response.text
dom = BeautifulSoup(whole_source, 'html.parser')
div = dom.select('div.text_tit')
#print(div)
for d in div:
    durl=d.find('a')['href']
    durl='https://kbench.com'+durl
    #print(durl)
    result=getInfo(durl)





