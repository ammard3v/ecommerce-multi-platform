import "dotenv/config";
import mongoose from "mongoose";
import fs from "fs";
import path from "path";
import cloudinary from "cloudinary";
import Product from "../../features/product/product_model.js";
cloudinary.v2.config({
  cloud_name: process.env.CLOUD_NAME,
  api_key: process.env.CLOUD_API_KEY,
  api_secret: process.env.CLOUD_API_SECRET,
});
const DB = process.env.DB_URL;
try {
  await mongoose.connect(DB);
  console.log("✅ Connected to MongoDB");
} catch (err) {
  console.error("❌ MongoDB connection error:", err);
  process.exit(1);
}
const PRODUCTS_JSON = path.resolve("./products.json");
const IMAGES_FOLDER = path.resolve("../../common/seeders/imagesUpload");
const products = JSON.parse(fs.readFileSync(PRODUCTS_JSON, "utf-8"));
const seedProducts = async () => {
  try {
    await Product.deleteMany();
    console.log("🧹 Products cleared");
    for (const prod of products) {
      const imagePaths = Array.isArray(prod.images)
        ? prod.images
        : [prod.images];
      const uploadResults = [];
      for (const img of imagePaths) {
        const imgPath = path.join(IMAGES_FOLDER, img);
        if (!fs.existsSync(imgPath)) {
          console.warn(`⚠️ Image not found: ${img}, skipping`);
          continue;
        }
        const result = await cloudinary.v2.uploader.upload(imgPath, {
          folder: "products",
        });
        uploadResults.push(result.secure_url);
      }
      if (uploadResults.length === 0) {
        const placeholderPath = path.join(IMAGES_FOLDER, "placeholder.jpg");
        if (fs.existsSync(placeholderPath)) {
          const result = await cloudinary.v2.uploader.upload(placeholderPath, {
            folder: "products",
          });
          uploadResults.push(result.secure_url);
        } else {
          console.warn(
            `⚠️ Placeholder image not found. Product "${prod.title}" will have no images.`,
          );
        }
      }
      await Product.create({
        title: prod.title,
        slug: prod.title
          .toLowerCase()
          .replace(/\s+/g, "-")
          .replace(/[^\w-]+/g, ""),
        description: prod.description,
        price: prod.price,
        discount: prod.discount || 0,
        stock: prod.stock || 0,
        is_featured: prod.is_featured || false,
        category: prod.category,
        images: uploadResults,
      });
      console.log(`✅ Product "${prod.title}" uploaded`);
    }
    console.log(`🎉 All products seeded`);
    await mongoose.disconnect();
    console.log("🛑 MongoDB disconnected");
    process.exit(0);
  } catch (err) {
    console.error("❌ Seeding failed:", err);
    process.exit(1);
  }
};
seedProducts();
