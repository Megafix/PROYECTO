// Importa las dependencias necesarias
const functions = require("firebase-functions");
const express = require("express");
const cors = require("cors");
const mercadopago = require("mercadopago");

// Inicializa la aplicación Express
const app = express();

// Permite solicitudes CORS de cualquier origen (ajusta esto si tienes requisitos más específicos)
app.use(cors({ origin: true }));  // Permite solicitudes CORS
app.use(express.json());  // Para manejar solicitudes JSON

// Configura Mercado Pago con tu Access Token (reemplaza "TU_ACCESS_TOKEN" con tu token real)
mercadopago.configure({
  access_token: "TU_ACCESS_TOKEN",  // Reemplaza con tu token de acceso de Mercado Pago
});

// Define la ruta para crear la preferencia de pago
app.post("/create-preference", async (req, res) => {
  try {
    // Extrae el precio y el email del cuerpo de la solicitud
    const { work_price, email } = req.body;

    // Definir la preferencia de pago en Mercado Pago
    let preference = {
      items: [
        {
          title: "Pago por servicio",  // Nombre del servicio
          unit_price: parseFloat(work_price),  // El precio del servicio
          quantity: 1,  // Cantidad de ítems
          currency_id: "ARS",  // Moneda (ajusta esto según la moneda que usas)
        },
      ],
      payer: {
        email: email,  // Email del usuario que realiza el pago
      },
      back_urls: {
        success: "https://TU_APP/success",  // URL de éxito
        failure: "https://TU_APP/failure",  // URL de error
        pending: "https://TU_APP/pending",  // URL de pago pendiente
      },
      auto_return: "approved",  // Regresa automáticamente a la URL de éxito si el pago es aprobado
    };

    // Crea la preferencia de pago en Mercado Pago
    const response = await mercadopago.preferences.create(preference);
    
    // Devuelve el link para iniciar el pago
    res.json({ init_point: response.body.init_point });
  } catch (error) {
    // Si hay un error, lo captura y responde con un código 500
    console.error(error);
    res.status(500).send("Error al procesar el pago");
  }
});

// Exporta la API Express como una función de Firebase
exports.api = functions.https.onRequest(app);
