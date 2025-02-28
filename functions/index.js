// Importa las dependencias necesarias
const functions = require("firebase-functions");
const express = require("express");
const cors = require("cors");
const mercadopago = require("mercadopago");

// Inicializa la aplicación Express
const app = express();
app.use(cors({ origin: true }));  // Permite solicitudes CORS
app.use(express.json());  // Para manejar solicitudes JSON

// Configura Mercado Pago con tu Access Token
mercadopago.configure({
  access_token: "TU_ACCESS_TOKEN",  // Reemplaza con tu token
});

// Define la ruta para crear la preferencia de pago
app.post("/create-preference", async (req, res) => {
  try {
    const { work_price, email } = req.body;

    let preference = {
      items: [
        {
          title: "Pago por servicio",
          unit_price: parseFloat(work_price),
          quantity: 1,
          currency_id: "ARS",  // Asegúrate de usar la moneda correcta
        },
      ],
      payer: {
        email: email,
      },
      back_urls: {
        success: "https://TU_APP/success",  // Reemplaza con tus URLs
        failure: "https://TU_APP/failure",
        pending: "https://TU_APP/pending",
      },
      auto_return: "approved",  // Vuelve automáticamente a la URL de éxito si el pago es aprobado
    };

    // Crea la preferencia de pago en Mercado Pago
    const response = await mercadopago.preferences.create(preference);
    res.json({ init_point: response.body.init_point });  // Devuelve el link para iniciar el pago
  } catch (error) {
    console.error(error);
    res.status(500).send("Error al procesar el pago");
  }
});

// Exporta la API Express como una función de Firebase
exports.api = functions.https.onRequest(app);
