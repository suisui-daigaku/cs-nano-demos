import socket
import sys
import os
import mimetypes

# 1. Check if the user provided a filename in the command line
if len(sys.argv) < 2:
    print("Usage: python server.py <path_to_html_files>")
    print("Example: python server.py my_website")
    print("Note: if the current directory is the web root, you can use '.' as the path.")
    sys.exit(1)

filepath = sys.argv[1]

# 2. Check if the provided file actually exists on the computer
if not os.path.exists(filepath):
    print(f"Error: The file path '{filepath}' was not found.")
    sys.exit(1)

# 4. Set up the server connection
HOST = '127.0.0.1'
PORT = 8080

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
    # Allow port to be reused immediately
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_socket.bind((HOST, PORT))
    server_socket.listen(1)
    
    print(f"Server is running! Open your browser to http://{HOST}:{PORT}")
    print("Press Ctrl+C in this terminal to stop the server.")
    
    try:
        # 5. Infinite loop to handle incoming browser requests
        while True:
            client_connection, client_address = server_socket.accept()
            
            with client_connection:
                # Receive the request
                request_data = client_connection.recv(1024)

                if not request_data:
                    continue
                
                # Parse the HTTP request line to get the requested path
                request_text = request_data.decode('utf-8', errors='ignore')
                request_line = request_text.split('\r\n')[0]
                
                parts = request_line.split(' ')
                if len(parts) < 2:
                    continue
                    
                path = parts[1]
                
                # Determine which file the browser is asking for
                if path == '/':
                    target_file = filepath + '/index.html'
                else:
                    target_file = filepath + path
                
                # 在开发过程中，浏览器可能会请求不存在的.well-known/appspecific/com.chrome.devtools.json静态资源，导致服务端返回404警告
                if not path.startswith('/.well-known/'):
                    try:
                        # Read the requested file in binary mode (works for images, JS, CSS, HTML)
                        with open(target_file, 'rb') as f:
                            file_content = f.read()
                        
                        # Guess the correct MIME type (e.g., application/javascript for .js files)
                        content_type, _ = mimetypes.guess_type(target_file)
                        if content_type is None:
                            content_type = 'application/octet-stream'
                            
                        # Formulate the HTTP headers
                        http_headers = (
                            "HTTP/1.1 200 OK\r\n"
                            f"Content-Type: {content_type}\r\n"
                            f"Content-Length: {len(file_content)}\r\n"
                            "Connection: close\r\n"
                            "\r\n"
                        )
                        
                        # Combine the headers and the file content
                        full_response = http_headers.encode('utf-8') + file_content
                        client_connection.sendall(full_response)
                        print(f"[Log] 200 OK: Served '{target_file}'")
                        
                    except FileNotFoundError:
                        if path == '/':
                            # If the root path is requested and index.html is missing, serve a default welcome message
                            default_html = b"<h2>Welcome to Python3 Web Server</h2>"
                            http_headers = (
                                "HTTP/1.1 200 OK\r\n"
                                "Content-Type: text/html; charset=utf-8\r\n"
                                f"Content-Length: {len(default_html)}\r\n"
                                "Connection: close\r\n"
                                "\r\n"
                            )
                            client_connection.sendall(http_headers.encode('utf-8') + default_html)
                            print(f"[Log] index.html not found in '{filepath}'")
                        else:
                            # Handle the case where the file or link doesn't exist
                            error_html = b"<h2>404 Page Not Found</h2>"
                            http_headers = (
                                "HTTP/1.1 404 Not Found\r\n"
                                "Content-Type: text/html; charset=utf-8\r\n"
                                f"Content-Length: {len(error_html)}\r\n"
                                "Connection: close\r\n"
                                "\r\n"
                            )
                            client_connection.sendall(http_headers.encode('utf-8') + error_html)
                            print(f"[Log] 404 Not Found: '{target_file}'")
                    
    except KeyboardInterrupt:
        # Gracefully handle the user pressing Ctrl+C
        print("\nServer shutting down.")