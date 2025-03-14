const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const stripeModule = require("stripe");

// Credentials
const kStripeProdSecretKey =
  "APP_USR-320738281269718-022117-d25aa3eec6a3f53a0a7b9965a35d149b-2280283251";
const kStripeTestSecretKey = "";

const secretKey = (isProd) =>
  isProd ? kStripeProdSecretKey : kStripeTestSecretKey;

/**
 *
 */
exports.initStripePayment = functions
  .region("us-central1")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return await initPayment(data, true);
  });

/**
 *
 */
exports.initStripeTestPayment = functions
  .region("us-central1")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return await initPayment(data, false);
  });

async function initPayment(data, isProd) {
  try {
    const stripe = new stripeModule.Stripe(secretKey(isProd), {
      apiVersion: "2020-08-27",
    });

    const customers = await stripe.customers.list({
      email: data.email,
      limit: 1,
    });
    var customer = customers.data[0];
    if (!customer) {
      customer = await stripe.customers.create({
        email: data.email,
        ...(data.name && { name: data.name }),
      });
    }

    const ephemeralKey = await stripe.ephemeralKeys.create(
      { customer: customer.id },
      { apiVersion: "2020-08-27" },
    );
    const paymentIntent = await stripe.paymentIntents.create({
      amount: data.amount,
      currency: data.currency,
      customer: customer.id,
      ...(data.description && { description: data.description }),
    });

    return {
      paymentId: paymentIntent.id,
      paymentIntent: paymentIntent.client_secret,
      ephemeralKey: ephemeralKey.secret,
      customer: customer.id,
      success: true,
    };
  } catch (error) {
    console.log(`Error: ${error}`);
    return { success: false, error: userFacingMessage(error) };
  }
}

/**
 * Sanitize the error message for the user.
 */
function userFacingMessage(error) {
  return error.type
    ? error.message
    : "An error occurred, developers have been alerted";
}
exports.onUserDeleted = functions
  .region("us-central1")
  .auth.user()
  .onDelete(async (user) => {
    let firestore = admin.firestore();
    let userRef = firestore.doc("users/" + user.uid);
    await firestore
      .collection("users")
      .where("uid", "==", user.uid)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          await doc.ref
            .collection("card")
            .get()
            .then(async (q) => {
              for (var d of q.docs) {
                console.log(`Deleting document ${d.id} from collection card`);
                await d.ref.delete();
              }
            });
        }
      });
    await firestore
      .collection("users")
      .where("uid", "==", user.uid)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          await doc.ref
            .collection("adress")
            .get()
            .then(async (q) => {
              for (var d of q.docs) {
                console.log(`Deleting document ${d.id} from collection adress`);
                await d.ref.delete();
              }
            });
        }
      });
    await firestore
      .collectionGroup("services")
      .where("uid", "==", user.uid)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          console.log(`Deleting document ${doc.id} from collection services`);
          await doc.ref.delete();
        }
      });
    await firestore.collection("users").doc(user.uid).delete();
    await firestore
      .collection("orders")
      .where("uid", "==", user.uid)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          console.log(`Deleting document ${doc.id} from collection orders`);
          await doc.ref.delete();
        }
      });
    await firestore
      .collection("freelancers")
      .where("uid", "==", user.uid)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          console.log(
            `Deleting document ${doc.id} from collection freelancers`,
          );
          await doc.ref.delete();
        }
      });
  });
