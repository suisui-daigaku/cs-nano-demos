from bs4 import BeautifulSoup
import json

# Open your local HTML file
with open('guardian.html', 'r', encoding='utf-8') as file:
    # Read the contents of the file
    html_content = file.read()

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(html_content, 'html.parser')  # You can also use 'html.parser/lxml'

allData = soup.find_all("div",{"class":"g"})

g=0
Data = [ ]
l = {}
for i in range(0, len(allData)):
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


person_json = json.dumps(Data)
print(person_json)