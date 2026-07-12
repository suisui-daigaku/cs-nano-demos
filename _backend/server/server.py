import socket

# 1. Define host and port
HOST = '127.0.0.1' # Localhost
PORT = 8080

# 2. Create a TCP/IP socket
# AF_INET means IPv4, SOCK_STREAM means TCP
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
    # Allow the port to be reused immediately after restarting the script
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    
    # 3. Bind the socket to the address and port
    server_socket.bind((HOST, PORT))
    
    # 4. Start listening for incoming connections
    server_socket.listen(1)
    print(f"Serving HTTP on port {PORT} (http://{HOST}:{PORT}/) ...")
    
    while True:
        # 5. Wait for a client (browser) to connect
        client_connection, client_address = server_socket.accept()
        
        with client_connection:
            # 6. Receive the HTTP request data from the browser
            request_data = client_connection.recv(1024).decode('utf-8')
            print(f"Received request:\n{request_data}")
            
            # 7. Formulate an HTTP response
            # Note the \r\n\r\n - this blank line separates headers from the body!
            http_response = """\
HTTP/1.1 200 OK
Content-Type: text/html

<html>
<head><title>Python Server</title></head>
<body>
    <h1>Hello from Python!</h1>
    <p>You successfully built an HTTP server from scratch.</p>
</body>
</html>
"""
            # 8. Send the response back to the client
            client_connection.sendall(http_response.encode('utf-8'))