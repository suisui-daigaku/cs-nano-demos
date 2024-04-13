

```python 
import requests
from bs4 import BeautifulSoup

# Google search URL
url = 'https://www.google.com/search'
search_query = 'example search'

# Make the HTTP request to Google
response = requests.get(url, params={'q': search_query})

# Parse the HTML content
soup = BeautifulSoup(response.text, 'html.parser')

# Find all search result titles
titles = soup.find_all('h3')

# Open a text file and write the titles
with open('search_results.txt', 'w', encoding='utf-8') as file:
    for title in titles:
        file.write(title.get_text() + '\n')

print("Search results have been saved to 'search_results.txt'")
```