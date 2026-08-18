import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const imagesFolder = path.join(__dirname, "imagesUpload");
const categoryMap = {
  1: "694113797b8871b6c86e7526", 
  2: "69413a1a8e0e3d48d11f7bf6", 
  3: "6941514953b6969aed2d3ec6", 
  4: "6941514f53b6969aed2d3ec9", 
  5: "6941515653b6969aed2d3ecc", 
  6: "6941516553b6969aed2d3ecf", 
  7: "6941513f53b6969aed2d3ec3", 
};
const randomPrice = () => Math.floor(Math.random() * (500 - 50 + 1)) + 50;
const randomDiscount = () => Math.floor(Math.random() * 51);
const randomStock = () => Math.floor(Math.random() * 20) + 1;
const generateFakeDescription = () => {
  const words = [
    "premium",
    "quality",
    "durable",
    "stylish",
    "modern",
    "elegant",
    "comfortable",
    "lightweight",
    "perfect",
    "designed",
    "crafted",
    "experience",
    "performance",
    "excellent",
    "amazing",
    "product",
    "value",
    "affordable",
    "innovative",
    "beautiful",
    "compact",
    "versatile",
    "long-lasting",
    "reliable",
    "exclusive",
  ];
  const wordCount = Math.floor(Math.random() * (80 - 30 + 1)) + 30;
  let desc = [];
  for (let i = 0; i < wordCount; i++) {
    desc.push(words[Math.floor(Math.random() * words.length)]);
  }
  return desc.join(" ") + ".";
};
const files = fs.readdirSync(imagesFolder);
const featuredIndexes = new Set();
while (featuredIndexes.size < 5 && featuredIndexes.size < files.length) {
  featuredIndexes.add(Math.floor(Math.random() * files.length));
}
const products = files.map((file, index) => {
  const nameWithoutExt = file.replace(/\.[^/.]+$/, "");
  const match = nameWithoutExt.match(/^(\d+)/);
  const categoryNumber = match ? parseInt(match[1]) : null;
  const cleanTitle = nameWithoutExt.replace(/^\d+/, "").trim();
  return {
    title: cleanTitle,
    description: generateFakeDescription(),
    price: randomPrice(),
    discount: randomDiscount(),
    is_featured: featuredIndexes.has(index),
    category: categoryMap[categoryNumber] || null,
    stock: randomStock(),
    image: [file],
  };
});
fs.writeFileSync(
  path.join(__dirname, "products.json"),
  JSON.stringify(products, null, 2),
);
console.log("✅ products.json generated with", products.length, "products");