# Single Page Application Browser History API

### Why use this over the modern History API?

Today, modern frameworks (React Router, Vue Router) default to the **Browser History API** instead of Hash routing because it allows for clean URLs without the `#` (e.g., `localhost:3000/about`). However, History API routers require special configuration on your web server so that it doesn't try to actually look for a folder named `/about` when the user refreshes the page.

Hash routers are fantastic because they **require zero server configuration**. They work perfectly even if you just open the HTML file directly from your hard drive.

- Hash 
  - under IE 9 
  - static web page also okay 
  - no seo required 
  - a few lines of code 
- History 
  - modern browser since 2010
  - need server/backend configuration 
  - seo required 
  - bussiness level application 

### Implement a Router using History API 

Unlike the Hash Router, which relies on a URL quirk, the History API Router is the modern standard used by frameworks like React, Vue, and Angular. It gives you clean URLs (like localhost:3000/about) without the # symbol.

To make this work, we have to use JavaScript to manually hijack all link clicks, stop the browser's default behavior, and use `history.pushState()` to change the URL silently.

