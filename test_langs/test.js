const net = require("net");

const server = net.createServer((socket) => {
  console.log("Client connected:", socket.remoteAddress);

  socket.on("data", (data) => {
    const message = data.toString().trim();
    console.log("Received:", message);
    if (message === "exit") {
      console.log("Client disconnected:", socket.remoteAddress);
      socket.end();
    } else {
      socket.write(`Echo: ${message}\n`);
    }
  });

  socket.on("end", () => {
    console.log("Client disconnected:", socket.remoteAddress);
  });
});

server.listen(8080, () => {
  console.log("TCP server listening on port 8080");
});
