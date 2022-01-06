const express = require("express");
const server = express();
const cors = require("cors");
const CORS_OPTIONS = {
  origin: "http://localhost:4200",
  optionsSuccessStatus: 200,
};
const port = 3000;

server.use(cors(CORS_OPTIONS));
server.use(express.json());
server.use(express.urlencoded({ extended: true }));

const USERS = [
  {
    id: 1,
    name: "Rushikesh",
  },
  {
    id: 2,
    name: "Ruturaj",
  },
  {
    id: 3,
    name: "Akash",
  },
];

// #############################################################################//

server.get("/", (req, res) => {
  res.send("express is working");
});

server.get("/users", (req, res) => {
  res.setHeader("Content-Type", "application/json");
  res.send(USERS);
  // res.send('Hello Again Madhav!');
});

server.listen(port, () => {
  console.log(`http://localhost:${port} running`);
});