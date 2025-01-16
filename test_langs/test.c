#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

void handle_client(int client_sock) {
    char buffer[1024];
    while (1) {
        int read_size = recv(client_sock, buffer, sizeof(buffer) - 1, 0);
        if (read_size <= 0) {
            printf("Client disconnected\n");
            break;
        }
        buffer[read_size] = '\0';
        printf("Received: %s", buffer);

        if (strncmp(buffer, "exit", 4) == 0) {
            printf("Closing connection\n");
            break;
        }

        send(client_sock, buffer, strlen(buffer), 0);
    }
    close(client_sock);
}

int main() {
    int server_sock, client_sock;
    struct sockaddr_in server_addr, client_addr;
    socklen_t addr_size;

    server_sock = socket(AF_INET, SOCK_STREAM, 0);
    if (server_sock == -1) {
        perror("Socket creation failed");
        exit(EXIT_FAILURE);
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(8080);

    if (bind(server_sock, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
        perror("Bind failed");
        close(server_sock);
        exit(EXIT_FAILURE);
    }

    listen(server_sock, 3);
    printf("TCP server listening on port 8080\n");

    while ((client_sock = accept(server_sock, (struct sockaddr*)&client_addr, &addr_size))) {
        printf("Client connected\n");
        if (fork() == 0) { // Child process to handle the client
            handle_client(client_sock);
            exit(0);
        }
        close(client_sock); // Parent process closes its copy
    }

    close(server_sock);
    return 0;
}
