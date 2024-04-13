import json
import requests
from bs4 import BeautifulSoup

# Open a text file and write the titles
output = open('guardians_articles_Christchurch_shooting.md', 'w', encoding='utf-8')

# Path to your JSON file
filename = 'guardian_Christchurch_shooting.json'

# Open the JSON file for reading
with open(filename, 'r') as file:
    # Load JSON data from file
    data = json.load(file)

# Access data (Object)
# print(data) 

#  h1 dcr-h5yuj3
#  div dcr-1qp23oo
#  <div id="maincontent" class="dcr-lw02qf">
#  p dcr-4cudl2
#
# iterate links in the object 
for item in data:
    # URL of the webpage you want to scrape
    url = item['link']
    # Send a GET request to the webpage
    response = requests.get(url)
    # Parse the HTML content of the page with BeautifulSoup
    soup = BeautifulSoup(response.text, 'html.parser')
    # title 
    title = soup.find('div', {'data-gu-name':'headline'})
    h1_title = title.find('h1')
    try:
        output.write('## ' + str(item['position']) + ', ' + h1_title.get_text() + '\n\n')
    except: 
        output.write('>' + 'None\n\n')
    # link
    output.write(item['link'] + '\n\n')
    # summary 
    abstract = soup.find('div', {'data-gu-name':'standfirst'})
    try:
        output.write('> ' + abstract.get_text() + '\n\n')
    except:
        output.write('>' + 'None\n\n')
    # paragraphs 
    try:
        body = soup.find('div', {'data-gu-name': 'body'})
        paragraphs = body.find_all('p')
        for p in paragraphs:
            output.write(p.text + '\n\n')
    except: 
         output.write('None\n\n')
    print(item["position"], item["title"])
    break

output.close()

