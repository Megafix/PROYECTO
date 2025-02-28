const functions = require("firebase-functions");
const express = require("express");
const cors = require("cors");
const mercadopago = require("mercadopago");

// Configurar Mercado Pago con tu Access Token
mercadopago.configure({
  access_token: "TU_ACCESS_TOKEN",
});

// Inicializar Express
const app = express();
app.use(cors({ origin: true }));
app.use(express.json()); // Para manejar JSON en las solicitudes

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

// Exportar la API como una Cloud Function
exports.api = functions.https.onRequest(app);
