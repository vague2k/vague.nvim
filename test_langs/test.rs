use tokio::net::TcpListener;
use tokio::io::{AsyncBufReadExt, AsyncWriteExt, BufReader};
use std::sync::Arc;

#[tokio::main]
async fn main() -> std::io::Result<()> {
    let listener = TcpListener::bind("0.0.0.0:8080").await?;
    println!("TCP server listening on port 8080");

    loop {
        let (socket, addr) = listener.accept().await?;
        println!("Client connected: {}", addr);

        tokio::spawn(async move {
            let (reader, mut writer) = socket.into_split();
            let mut reader = BufReader::new(reader);
            let mut buf = String::new();

            loop {
                buf.clear();
                let bytes_read = reader.read_line(&mut buf).await.unwrap_or(0);
                if bytes_read == 0 {
                    println!("Client disconnected: {}", addr);
                    break;
                }

                println!("Received: {}", buf.trim_end());
                if buf.trim_end() == "exit" {
                    println!("Closing connection for: {}", addr);
                    break;
                }

                writer.write_all(format!("Echo: {}\n", buf).as_bytes()).await.unwrap();
            }
        });
    }
}
