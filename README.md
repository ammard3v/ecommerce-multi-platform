# 🛍️ Full-Stack eCommerce Application

![App Logo](https://raw.githubusercontent.com/ammard3v/ecommerce-multi-platform/ba775c18e7fc52001c51044d806c93906dbe1c09/eShop/android/app/src/main/res/drawable-hdpi/splash.png)

A production-style Full-Stack eCommerce application developed independently with heavy focus on Flutter app, while also designing and implementing the backend API and integrating an admin panel.

The project covers the complete eCommerce flow from auth, product search, cart,wishlist, checkout, payments, order tracking, and push notifications.

I developed it to follow clean arch to extreme though I won't recommend to do so. It taught me a lot in my app dev journey and it was tedious to be honest and yes AI was also used to guide along. Initially, I didn't plan to opensource the project but later changed my mind. I dn't have any plans to further improve it and btw it took me around 5+ months as I am learning and practicing many new concepts.

---

## 🚀 Project Overview

This project consists of three main parts:

### 📱 1. User Application — Flutter

A feature-rich Flutter application built using **Clean Architecture** and **BLoC**, with an emphasis on scalability, maintainability, and reliable API communication.

**Architecture & Core Technologies**

- Clean Architecture
- BLoC / Cubit for state management
- GoRouter for navigation
- GetIt + Injectable for dependency injection
- Dio + Retrofit for REST API communication
- Dio interceptors for automatic access/refresh token handling
- Freezed & JSON Serializable for data models
- Deep linking for email/account verification
- Stripe integration for online payments
- Firebase Authentication & Google Sign-In
- Firebase Cloud Messaging (FCM)
- Connectivity monitoring

---

### ⚙️ 2. Backend — Node.js / Express

A RESTful backend responsible for the application's business logic, authentication, database operations, payments, notifications, and file handling.

**Main Features**

- RESTful API architecture
- JWT-based authentication
- Access & refresh token system
- Role-based authorization
- User management
- Product & category management
- Cart & wishlist management
- Address management
- Order management
- Product reviews & ratings
- Stripe payment integration
- Firebase push notifications
- Image/file uploads
- Admin-specific APIs

**Backend Stack**

- Node.js
- Express.js
- MongoDB
- Mongoose
- Stripe
- Firebase
- Cloudinary
- Multer

---

### 🖥️ 3. Admin Panel — React

An admin panel for managing the application's core eCommerce operations.

**Admin Features**

- 👤 User management
  - Enable/disable accounts
  - Manage users

- 📦 Product management
  - Create products
  - Update products
  - Delete products
  - Manage product information

- 🛒 Order management
  - View orders
  - Track orders
  - Update order status

- 🔔 Notifications
  - Send targeted push notifications
  - Broadcast notifications

> The admin dashboard UI was prepared in collaboration with a friend, while the backend functionality and integrations were implemented as part of the project.

---

# ✨ Key Features

### 🔐 Advanced Authentication

- Email/password authentication
- Google authentication
- Account verification
- OTP verification
- Forgot/reset password flow
- Access & refresh token authentication
- Automatic token refresh using Dio interceptors
- Protected routes
- Role-based authorization

### 🛍️ Shopping Experience

- Product browsing
- Product search
- Category filtering
- Featured products
- Product reviews & ratings
- Wishlist
- Shopping cart
- Quantity management
- Address management

### 💳 Payments & Orders

- Cash on Delivery
- Stripe online payments
- Stripe test mode
- Order creation
- Order history
- Order status tracking
- Payment/order synchronization

### 🔔 Notifications

- Firebase Cloud Messaging (FCM)
- Order status notifications
- Targeted notifications
- Broadcast notifications
- Notification read/unread state

### 🌐 Other

- Internet connectivity detection
- Deep linking
- Image uploading
- Cached network images
- Responsive UI
- Loading/skeleton states
- Error handling
- API logging & debugging

---

# 🏗️ Architecture

The Flutter application follows **Clean Architecture** with a feature-based structure.

```text
Presentation
     ↓
    BLoC
     ↓
   Domain
     ↓
Repository
     ↓
   Data
     ↓
 REST API
```

## 🔌 API Modules

The backend provides RESTful APIs for the following modules:

### 🔐 Authentication — `/auth`

```text
POST   /auth/signIn
POST   /auth/signUp
POST   /auth/googleSignUp
POST   /auth/token
DELETE /auth/logout
POST   /auth/resend-otp
POST   /auth/forgotPassword
POST   /auth/verifyAccount
POST   /auth/resetPassword
```

### 🛍️ Products — `/products`

```text
GET    /products
POST   /products
GET    /products/search
GET    /products/top-5-cheap
GET    /products/top-featured
GET    /products/product-stats
GET    /products/category/:id
GET    /products/:id
PUT    /products/:id
DELETE /products/:id

GET    /products/:productId/reviews
POST   /products/:productId/reviews
GET    /products/:productId/reviews/me
PATCH  /products/:productId/reviews/:reviewId
DELETE /products/:productId/reviews/:reviewId
```

### 📂 Categories — `/categories`

```text
GET    /categories
GET    /categories/:id
POST   /categories
PATCH  /categories/:id
DELETE /categories/:id
```

### 👤 Users — `/users`

```text
GET    /users/me
PATCH  /users/me
DELETE /users/me
PATCH  /users/updateMyPassword

GET    /users/:id
PATCH  /users/:id
DELETE /users/:id
PATCH  /users/active/:id
GET    /users
```

### 📍 Addresses — `/addresses`

```text
GET    /addresses/me
POST   /addresses/me
GET    /addresses/:id
PATCH  /addresses/:id
DELETE /addresses/:id
PATCH  /addresses/:id/set-default
GET    /addresses/admin/all
```

### 🛒 Cart — `/cart`

```text
GET    /cart/me
POST   /cart/me
PATCH  /cart/me
DELETE /cart/clear
DELETE /cart/:id
```

### ❤️ Wishlist — `/wishlist`

```text
GET    /wishlist/me
POST   /wishlist/:productId
POST   /wishlist/add/:productId
DELETE /wishlist/add/:productId
```

### 📦 Orders — `/orders`

```text
POST   /orders/me
GET    /orders/me
GET    /orders/getAllOrders
GET    /orders/:orderId
GET    /orders/payment/:paymentIntentId
POST   /orders/:orderId
```

### 💳 Payments — `/payments`

```text
POST   /payments/create-intent
POST   /payments/webhook
```

### 🔔 Notifications — `/notifications`

```text
GET    /notifications/me
PATCH  /notifications/read/:notificationId
POST   /notifications/custom
POST   /notifications/send-all
```

### 📲 FCM — `/notifications/fcm`

```text
POST   /notifications/fcm/save-token
POST   /notifications/fcm/read
```

### 📤 Upload — `/upload`

```text
POST   /upload
```

> **Note:** Authentication-protected and admin-only endpoints are enforced through middleware on the backend.

---

# 📦 Key Flutter Packages

| Package                | Purpose                   |
| ---------------------- | ------------------------- |
| `flutter_bloc`         | State management          |
| `dio`                  | HTTP networking           |
| `retrofit`             | Type-safe API client      |
| `get_it`               | Dependency injection      |
| `injectable`           | DI code generation        |
| `go_router`            | Navigation & deep linking |
| `freezed`              | Immutable data models     |
| `flutter_stripe`       | Payment integration       |
| `firebase_auth`        | Authentication            |
| `firebase_messaging`   | Push notifications        |
| `google_sign_in`       | Google authentication     |
| `shared_preferences`   | Local storage             |
| `cached_network_image` | Image caching             |

---

# 📲 Try the App

### 🔑 Test Credentials

```text
Email: test@test.com
Password: 12345
```

You can also use **Google Sign-In** , but online hosted wnt allow.

> **Recommended:** Download the APK for the best experience.

### 📥 APK & Demo Videos

**[Download APK + Demo Videos](https://drive.google.com/drive/folders/1Ga5aja41Z7-Yl0LAQ4wMq2984NNXP726)**

### 🌐 Try Online

**[Open Web Demo](https://appetize.io/app/b_32aripjn3ccjn4igsm5zutaqea)**

---

# 📌 Demo Notes

- ✅ Android APK available
- ❌ iOS version not implemented yet(dev acc, iykuk)
- 💵 Cash on Delivery is available but 💳 Stripe payment is running in test mode
- 🔐 Test account is provided above
- ⏳ Initial startup takes a few moments because the backend is hosted on a free server
- If you try to create email otp wnt be received, yeah free server, better go with test creds.

---

# 🏷️ Tags

`#Flutter` `#Dart` `#NodeJS` `#ExpressJS` `#MongoDB`
`#CleanArchitecture` `#BLoC` `#Firebase` `#FCM`
`#Stripe` `#RESTAPI` `#FullStack` `#MobileDevelopment`
