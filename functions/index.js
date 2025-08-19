const functions = require("firebase-functions");
const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors({ origin: true }));
app.use(express.json());

app.get("/hello", (req, res) => {
  res.json({ message: "Hola desde Firebase Functions 🚀" });
});

exports.api = functions.https.onRequest(app);
