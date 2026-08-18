import { Resend } from "resend";
const resend = new Resend(process.env.RESEND_API_KEY);
const sendEmail = async (options) => {
  const { data, error } = await resend.emails.send({
    from: process.env.RESEND_FROM,
    to: [options.email],
    subject: options.subject,
    text: options.message,
  });
  if (error) {
    console.error("❌ Email sending failed:", error);
    throw new Error(error.message);
  }
  console.log("✅ Email sent:", data.id);
};
export default sendEmail;