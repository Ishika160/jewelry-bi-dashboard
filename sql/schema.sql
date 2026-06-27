-- ============================================================
-- Jewelry Business Intelligence System
-- Database Schema
-- ============================================================
-- Run: ddev mysql < sql/schema.sql
-- ============================================================

-- Use the default DDEV database
USE db;

-- Drop tables in reverse dependency order (if re-running)
DROP TABLE IF EXISTS sale_items;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

-- ============================================================
-- 1. CATEGORIES
-- Jewelry product categories (Chain, Ring, Bangle, etc.)
-- ============================================================
CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description   TEXT DEFAULT NULL,
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ============================================================
-- 2. PRODUCTS
-- Master product catalog from inventory data
-- ============================================================
CREATE TABLE products (
    product_id      INT AUTO_INCREMENT PRIMARY KEY,
    category_id     INT NOT NULL,
    product_name    VARCHAR(200) NOT NULL,
    sku             VARCHAR(50) NOT NULL UNIQUE COMMENT 'Product Code from ERP (e.g. CH01, RG29)',
    metal_type      VARCHAR(50) NOT NULL DEFAULT 'Gold',
    purity          VARCHAR(20) DEFAULT NULL COMMENT 'e.g. 18KT, 22KT',
    color           VARCHAR(50) DEFAULT NULL COMMENT 'e.g. Yellow Gold, Rose Gold',
    gross_weight    DECIMAL(10,3) DEFAULT NULL COMMENT 'Gross weight in grams',
    net_weight      DECIMAL(10,3) DEFAULT NULL COMMENT 'Net weight in grams',
    stone_weight    DECIMAL(10,3) DEFAULT 0.000 COMMENT 'Stone weight in grams',
    hallmark_code   VARCHAR(50) DEFAULT NULL COMMENT 'BIS Hallmark code',
    making_charges  DECIMAL(10,2) DEFAULT 0.00,
    cost_price      DECIMAL(12,2) DEFAULT 0.00,
    selling_price   DECIMAL(12,2) DEFAULT 0.00,
    additional_info TEXT DEFAULT NULL,
    is_active       TINYINT(1) DEFAULT 1,
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    INDEX idx_category (category_id),
    INDEX idx_purity (purity),
    INDEX idx_metal_type (metal_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ============================================================
-- 3. INVENTORY
-- Current stock levels for each product
-- ============================================================
CREATE TABLE inventory (
    inventory_id      INT AUTO_INCREMENT PRIMARY KEY,
    product_id        INT NOT NULL UNIQUE,
    quantity_in_stock  INT NOT NULL DEFAULT 0,
    reorder_level     INT DEFAULT 5,
    last_restocked    DATE DEFAULT NULL,
    updated_at        DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_inventory_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    INDEX idx_low_stock (quantity_in_stock)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ============================================================
-- 4. CUSTOMERS
-- Customer information & demographics
-- ============================================================
CREATE TABLE customers (
    customer_id       INT AUTO_INCREMENT PRIMARY KEY,
    customer_code     VARCHAR(20) NOT NULL UNIQUE COMMENT 'ERP code e.g. CUST0001',
    customer_name     VARCHAR(200) NOT NULL,
    phone             VARCHAR(15) DEFAULT NULL,
    email             VARCHAR(200) DEFAULT NULL,
    city              VARCHAR(100) DEFAULT NULL,
    state             VARCHAR(100) DEFAULT NULL,
    address           TEXT DEFAULT NULL,
    gender            ENUM('Male','Female','Other') DEFAULT NULL,
    customer_since    DATE DEFAULT NULL,
    customer_type     ENUM('Regular','Premium','VIP') DEFAULT 'Regular',
    created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_city (city),
    INDEX idx_customer_type (customer_type),
    INDEX idx_customer_since (customer_since)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ============================================================
-- 5. SALES
-- Sales transaction headers
-- ============================================================
CREATE TABLE sales (
    sale_id           INT AUTO_INCREMENT PRIMARY KEY,
    customer_id       INT DEFAULT NULL,
    invoice_number    VARCHAR(50) NOT NULL UNIQUE,
    sale_date         DATE NOT NULL,
    subtotal          DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    discount_percent  DECIMAL(5,2) DEFAULT 0.00,
    discount_amount   DECIMAL(12,2) DEFAULT 0.00,
    tax_percent       DECIMAL(5,2) DEFAULT 3.00 COMMENT 'GST',
    tax_amount        DECIMAL(12,2) DEFAULT 0.00,
    total_amount      DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    payment_method    ENUM('Cash','Card','UPI','Bank Transfer','EMI') DEFAULT 'Cash',
    payment_status    ENUM('Paid','Pending','Partial') DEFAULT 'Paid',
    created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_sale_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        ON DELETE SET NULL ON UPDATE CASCADE,

    INDEX idx_customer (customer_id),
    INDEX idx_sale_date (sale_date),
    INDEX idx_payment_status (payment_status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ============================================================
-- 6. SALE_ITEMS
-- Individual line items within each sale
-- ============================================================
CREATE TABLE sale_items (
    sale_item_id    INT AUTO_INCREMENT PRIMARY KEY,
    sale_id         INT NOT NULL,
    product_id      INT NOT NULL,
    quantity        INT NOT NULL DEFAULT 1,
    unit_price      DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    purity          VARCHAR(20) DEFAULT NULL,
    net_weight      DECIMAL(10,3) DEFAULT NULL COMMENT 'Weight at time of sale',
    wastage_percent DECIMAL(5,2) DEFAULT 0.00,
    gold_rate       DECIMAL(12,2) DEFAULT 0.00 COMMENT 'Gold rate per 10g at time of sale',
    making_charges  DECIMAL(10,2) DEFAULT 0.00,
    discount        DECIMAL(10,2) DEFAULT 0.00,
    total_price     DECIMAL(14,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT fk_saleitem_sale
        FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_saleitem_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    INDEX idx_sale (sale_id),
    INDEX idx_product (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ============================================================
-- VIEWS — Pre-computed queries for dashboard performance
-- ============================================================

-- Monthly sales summary
CREATE OR REPLACE VIEW v_sales_summary AS
SELECT
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sale_month,
    YEAR(s.sale_date) AS sale_year,
    MONTH(s.sale_date) AS sale_month_num,
    COUNT(DISTINCT s.sale_id) AS total_orders,
    SUM(s.total_amount) AS total_revenue,
    AVG(s.total_amount) AS avg_order_value,
    COUNT(DISTINCT s.customer_id) AS unique_customers
FROM sales s
GROUP BY sale_month, sale_year, sale_month_num
ORDER BY sale_month;


-- Inventory status with product details
CREATE OR REPLACE VIEW v_inventory_status AS
SELECT
    p.product_id,
    p.product_name,
    p.sku,
    c.category_name,
    p.purity,
    p.metal_type,
    p.selling_price,
    i.quantity_in_stock,
    i.reorder_level,
    (i.quantity_in_stock * p.selling_price) AS stock_value,
    CASE
        WHEN i.quantity_in_stock = 0 THEN 'Out of Stock'
        WHEN i.quantity_in_stock <= i.reorder_level THEN 'Low Stock'
        WHEN i.quantity_in_stock > i.reorder_level * 5 THEN 'Overstock'
        ELSE 'In Stock'
    END AS stock_status
FROM products p
JOIN inventory i ON p.product_id = i.product_id
JOIN categories c ON p.category_id = c.category_id
ORDER BY i.quantity_in_stock ASC;


-- Customer lifetime value
CREATE OR REPLACE VIEW v_customer_value AS
SELECT
    c.customer_id,
    c.customer_code,
    c.customer_name,
    c.city,
    c.customer_type,
    c.gender,
    COUNT(s.sale_id) AS total_orders,
    COALESCE(SUM(s.total_amount), 0) AS total_spent,
    COALESCE(AVG(s.total_amount), 0) AS avg_order_value,
    MIN(s.sale_date) AS first_purchase,
    MAX(s.sale_date) AS last_purchase,
    DATEDIFF(MAX(s.sale_date), MIN(s.sale_date)) AS customer_lifespan_days
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id;


-- Product performance (sales ranking)
CREATE OR REPLACE VIEW v_product_performance AS
SELECT
    p.product_id,
    p.product_name,
    p.sku,
    c.category_name,
    p.purity,
    COALESCE(SUM(si.quantity), 0) AS units_sold,
    COALESCE(SUM(si.total_price), 0) AS total_revenue,
    COUNT(DISTINCT si.sale_id) AS times_sold,
    MAX(s.sale_date) AS last_sold_date,
    DATEDIFF(CURDATE(), MAX(s.sale_date)) AS days_since_last_sale
FROM products p
JOIN categories c ON p.category_id = c.category_id
LEFT JOIN sale_items si ON p.product_id = si.product_id
LEFT JOIN sales s ON si.sale_id = s.sale_id
GROUP BY p.product_id;


-- ============================================================
-- Schema creation complete
-- ============================================================
SELECT 'Schema created successfully!' AS status;
