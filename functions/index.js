/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */
console.log("Iniciando servidor...");
console.log(`Puerto: ${port}`);

const PORT = process.env.PORT || 8080;

// Define tus rutas y middleware aquí

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});


const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
const functions = require("firebase-functions");
const mercadopago = require("mercadopago");
const cors = require("cors");
const express = require("express");

const app = express();
app.use(cors({ origin: true }));

// Configurar Mercado Pago con tu Access Token
mercadopago.configure({
  access_token: "TU_ACCESS_TOKEN",
});

// Crear un pago
app.post("/create-preference", async (req, res) => {
  try {
    const { work_price, email } = req.body;

    let preference = {
      items: [
        {
          title: "Pago por servicio",
          unit_price: parseFloat(work_price),
          quantity: 1,
          currency_id: "ARS",
        },
      ],
      payer: {
        email: email,
      },
      back_urls: {
        success: "https://TU_APP/success",
        failure: "https://TU_APP/failure",
        pending: "https://TU_APP/pending",
      },
      auto_return: "approved",
    };

    const response = await mercadopago.preferences.create(preference);
    res.json({ init_point: response.body.init_point });
  } catch (error) {
    console.error(error);
    res.status(500).send("Error al procesar el pago");
  }
});

// Exportar la API de pagos
exports.api = functions.https.onRequest(app);
