import sendFCM from "../notification/fcmService.js";
const userToken = user.fcmToken; 
if (userToken) {
  await sendTestNotification(
    userToken,
    "Order Created",
    "Your order has been successfully placed.",
    { orderId: newOrder._id.toString(), status: "pending" }
  );
}
async function sendTestNotification() {
  try {
    const response = await sendFCM(
      "dA7iqRdETXicEadPjK6l-_:APA91bGu2vpo5sgFec4FlPPXSVsW4x0EFNPAmS0P3Uu6CbvhjKKIcHczRGj_tyK0JWKAN3cyoa3r9XgKSG9uk-X1b8nlKnpgA5J1oy9ctPNj4N1wQw9a6FU", 
      "Test Notification", 
      "Hello, this is a test notification!", 
      { type: "TEST" } 
    );
    console.log("Notification sent successfully", response);
  } catch (err) {
    console.error("Error sending notification", err);
  }
}
