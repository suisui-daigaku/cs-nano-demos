# Router 

In traditional web development (MPA multiple page application), every time you click a link, your browser sends a request to the server/backend, downloads a brand new HTML page, and completely reloads the screen.

A frontend router changes this entirely. It is a piece of software used in Single Page Applications (SPAs) that allows you to change what the user sees on the screen and update the URL in the address bar without ever reloading the page.

前端路由是‌单页应用（SPA）中通过监听 URL 变化来动态映射并切换对应组件，从而实现无刷新页面跳转的状态管理机制‌。


## Multiple Page Application (MPA)

To see a true Multi-Page Application (MPA) in action, you need multiple separate HTML files. In an MPA, unlike the Single Page Application we discussed earlier, every time you click a link, the browser throws away the current page and asks the server for the next entire HTML file.

Here is an homage to the mid-90s web (inspired by the classic Yahoo! Directory).


## Single Page Application (SPA)

两种主流实现模式

- ‌Hash 模式‌：URL 带 # 符号（如 `site.com/#/home`）。利用 hashchange 事件监听，改变 `#` 后内容‌不会‌触发服务器请求，兼容性好但 URL 不够美观 
- History 模式‌：利用 HTML5 `pushState/replaceState` API，URL 整洁（如 `site.com/home`）。需‌服务器端配合配置‌（将所有路由请求重定向到入口 HTML），否则刷新页面可能报 404 。‌‌

