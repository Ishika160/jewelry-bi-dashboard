# Jewelry BI Dashboard 💎

A comprehensive, enterprise-grade Business Intelligence dashboard and inventory management system designed specifically for jewelry stores. Built with PHP, MySQL, and Python.

## 🌟 Features
* **Secure Authentication:** Role-based access control (Admin/Viewer) with bcrypt password hashing.
* **Real-time Inventory Tracking:** Instantly see Out of Stock, Low Stock, and Dead Stock items.
* **Smart Notifications:** Real-time bell alerts for low stock and sales milestones.
* **Global Search:** Press `Ctrl + K` anywhere to instantly search across your entire product catalog.
* **AI Demand Forecasting:** Built-in Python integration using Scikit-Learn to predict future product demand based on historical sales trends.
* **Modern UI/UX:** Responsive Dark Mode design featuring a sleek Glassmorphism aesthetic.
* **Print-Ready Reports:** Generate clean, print-friendly reports for your sales and inventory.

---

## 🚀 Setup Guide (XAMPP / Windows)

Follow these steps to run the Jewelry BI Dashboard locally using XAMPP.

### 1. Requirements
* [XAMPP](https://www.apachefriends.org/index.html) (with PHP 8.0 or higher)
* [Python 3.8+](https://www.python.org/downloads/) (Required for the AI Prediction module)

### 2. Move Project Files
1. Extract or clone this repository.
2. Copy the entire project folder into your XAMPP `htdocs` directory:
   `C:\xampp\htdocs\jewelry-bi`

### 3. Setup the Database
1. Open the **XAMPP Control Panel** and Start **Apache** and **MySQL**.
2. Open your browser and go to `http://localhost/phpmyadmin/`.
3. Click on **New** to create a new database. Name it `jewelry_db` (or whatever you prefer) and click **Create**.
4. Import the database schemas in this exact order:
   * Select your new `jewelry_db` database.
   * Click the **Import** tab.
   * Choose the file: `sql/schema.sql` and click **Import**.
   * Go back to the **Import** tab.
   * Choose the file: `sql/migration_auth.sql` and click **Import**.

### 4. Configure Environment Variables
1. Navigate to your project folder (`C:\xampp\htdocs\jewelry-bi`).
2. You will see a file named `.env` (If you don't see it, create one).
3. Open the `.env` file in a text editor (like VS Code or Notepad) and update the database credentials to match XAMPP:

```env
APP_NAME="Jewelry BI Dashboard"
APP_ENV="development"
TIMEZONE="Asia/Kolkata"

# XAMPP default MySQL credentials
DB_HOST="127.0.0.1"
DB_PORT=3306
DB_NAME="jewelry_db"
DB_USER="root"
DB_PASS=""
```

### 5. Setup Python AI Module (Required for Predictions)
The AI Demand Prediction module uses Python and Scikit-Learn.
1. Open your terminal or Command Prompt.
2. Install the required Python libraries:
   ```cmd
   pip install pandas scikit-learn
   ```

### 6. Launch the App
1. Open your browser and go to: `http://localhost/jewelry-bi/`
2. You will be automatically redirected to the **Registration** page since no users exist yet.
3. Create your Admin account.
4. Sign in and enjoy the dashboard!

---

## 🎓 About This Project
This software was developed as a **BCA Final Year Project**, demonstrating full-stack web development, database architecture, session security, and machine learning integration for business intelligence.
