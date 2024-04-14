from bs4 import BeautifulSoup
import requests

headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36'}

url='https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fwww.theguardian.com+prime+minister+ardern+christchurch+mosque+shootings&sca_esv=fc95be58e7f3d93a&sxsrf=ACQVn08hrt1kxDjDfT16x4QiR8RrV8qqug%3A1712983304095&source=hp&ei=CA0aZsbaAsyL0PEP7caloAM&iflsig=ANes7DEAAAAAZhobGJYFpeaTQnoCXsS0ooLWMTX2K_OC&oq=&gs_lp=Egdnd3Mtd2l6IgAqAggAMgcQIxjqAhgnMgcQIxjqAhgnMgcQIxjqAhgnMgcQIxjqAhgnMgcQIxjqAhgnMgcQIxjqAhgnMgcQIxjqAhgnMgcQIxjqAhgnMgcQIxjqAhgnMgcQIxjqAhgnMhYQABgDGI8BGOUCGOoCGLQCGIwD2AEBMhYQABgDGI8BGOUCGOoCGLQCGIwD2AEBMhYQABgDGI8BGOUCGOoCGLQCGIwD2AEBMhYQABgDGI8BGOUCGOoCGLQCGIwD2AEBMhYQABgDGI8BGOUCGOoCGLQCGIwD2AEBMhYQLhgDGI8BGOUCGOoCGLQCGIwD2AEBMhYQABgDGI8BGOUCGOoCGLQCGIwD2AEBMhYQABgDGI8BGOUCGOoCGLQCGIwD2AEBMhYQABgDGI8BGOUCGOoCGLQCGIwD2AEBMhYQABgDGI8BGOUCGOoCGLQCGIwD2AEBSMsOUABYAHACeACQAQCYAQCgAQCqAQC4AQHIAQCYAgKgAhioAhSYAw-6BgYIARABGAuSBwEyoAcA&sclient=gws-wiz'
html = requests.get(url, headers=headers)

soup = BeautifulSoup(html.text, 'html.parser')

allData = soup.find_all("div",{"class":"g"})

g=0
Data = [ ]
l={}
for i in range(0,len(allData)):
                    link = allData[i].find('a').get('href')

                    if(link is not None):
                        if(link.find('https') != -1 and link.find('http') == 0 and link.find('aclk') == -1):
                            g=g+1
                            l["link"]=link
                            try:
                                l["title"]=allData[i].find('h3',{"class":"DKV0Md"}).text
                            except:
                                l["title"]=None

                            try:
                                l["description"]=allData[i].find("div",{"class":"lyLwlc"}).text
                            except:
                                l["description"]=None

                            l["position"]=g

                            Data.append(l)

                            l={}

                        else:
                            continue

                    else:
                        continue

for b in Data:
    print(b)