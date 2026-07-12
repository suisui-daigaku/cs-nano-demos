# Hash Router 

Using a **Hash Router** is the oldest and simplest way to build a Single Page Application (SPA). It relies on a quirk of web browsers: **changing anything after the `#` (hash) in a URL does not trigger a page reload.**

Historically, ***the hash was used to jump to specific headers on a long webpage (like an anchor link).*** Frontend developers realized they could hijack this behavior, listen for changes to the hash using JavaScript, and swap out the page content themselves.

Here is exactly what the URL looks like and how to build one from scratch.

### What the URL looks like on your local machine

If you are just opening the HTML file directly from your computer (without a local server), the URL will use the `file://` protocol and look like this:

* **Base URL:** `file:///C:/Users/YourName/Desktop/index.html`
* **Navigating to "About":** `file:///C:/Users/YourName/Desktop/index.html#/about`

If you are running a local development server (like VS Code Live Server or Node.js), it will look like this:

* **Base URL:** `http://127.0.0.1:5500/` or `http://localhost:3000/`
* **Navigating to "About":** `http://127.0.0.1:5500/#/about`
  * Or in full `http://127.0.0.1:5500/index.html#/about`

**Note**: The URL Breakdown

- `http://` (The Protocol): Tells the browser how to talk to the server.
- `127.0.0.1` (The Host): This is your local machine (localhost).
- `:5500` (The Port): Think of this as a specific "door" on your computer that your local development server is listening to.
- `/` (The Path): This is the crucial part you asked about. It represents the "root directory" or the main folder of your website.
- `#/about` (The Hash/Fragment): This is the part handled entirely by the browser and your frontend JavaScript router.

If you want to add `index.html` to url, the complete url looks like `http://127.0.0.1:5500/index.html#/about`

---

### How to use a Hash Router in an HTML page (Object as Hash Table)

To see this in action, you only need one file. Save the following code as `index.html` and open it in your browser.

Notice how the `window.addEventListener('hashchange', ...)` tells the browser exactly what to do when the URL changes.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vanilla JS Hash Router</title>
    <style>
        body { font-family: sans-serif; padding: 20px; }
        nav { margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #ccc; }
        a { margin-right: 15px; text-decoration: none; color: blue; }
        #app { padding: 20px; background: #f4f4f4; border-radius: 8px; }
    </style>
</head>
<body>

    <nav>
        <a href="#/">Home</a>
        <a href="#/about">About Us</a>
        <a href="#/settings">Settings</a>
    </nav>

    <div id="app"></div>

    <script>
        // 3. Define your routes and the HTML content for each
        const routes = {
            '#/': '<h2>🏠 Home</h2><p>Welcome to the single-page app!</p>',
            '#/about': '<h2>ℹ️ About Us</h2><p>We built this router from scratch.</p>',
            '#/settings': '<h2>⚙️ Settings</h2><p>Adjust your preferences here.</p>'
        };

        // 4. The Router Function
        function router() {
            // Get the current hash from the URL (e.g., "#/about"). 
            // If there is no hash, default to "#/"
            let currentHash = window.location.hash || '#/';

            // Find the matching HTML content, or show a 404 message
            let content = routes[currentHash] || '<h2>404</h2><p>Page Not Found.</p>';

            // Inject the content into the viewport
            document.getElementById('app').innerHTML = content;
            
            console.log(`Mapsd to: ${currentHash}`);
        }

        // 5. Listen for URL changes
        window.addEventListener('hashchange', router);

        // 6. Run the router once when the page first loads
        window.addEventListener('DOMContentLoaded', router);
    </script>

</body>
</html>
```
