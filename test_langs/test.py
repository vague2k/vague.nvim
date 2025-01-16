import socket
from threading import Thread

def handle_client(client_socket, address):
    print(f"Client connected: {address}")
    with client_socket:
        while True:
            data = client_socket.recv(1024).decode('utf-8')
            if not data or data.strip() == "exit":
                print(f"Client disconnected: {address}")
                break
            print(f"Received: {data.strip()}")
            client_socket.sendall(f"Echo: {data}".encode('utf-8'))

def main():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(('0.0.0.0', 8080))
    server.listen(5)
    print("TCP server listening on port 8080")

    while True:
        client_socket, address = server.accept()
        thread = Thread(target=handle_client, args=(client_socket, address))
        thread.start()

if __name__ == "__main__":
    main()
