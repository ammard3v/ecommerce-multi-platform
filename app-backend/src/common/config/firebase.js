import admin from "firebase-admin";
const base64Key = process.env.FIREBASE_SERVICE_ACCOUNT_BASE64;
if (!base64Key) {
  console.error(
    "FIREBASE_SERVICE_ACCOUNT_BASE64 is missing: firebase not initialize."
  );
} else {
  const serviceAccount = JSON.parse(
    Buffer.from(base64Key, "base64").toString("utf8")
  );
  if (!admin.apps.length) {
    admin.initializeApp({
      credential: admin.credential.cert(serviceAccount),
    });
    console.log("firebase initialized");
  }
}
export default admin;