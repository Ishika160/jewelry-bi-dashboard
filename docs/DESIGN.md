# 📐 System Design Document

## Jewelry Business Intelligence System using ERP Data

**Project Type:** BCA Final Year Project
**Academic Year:** 2024–2026

---

## Table of Contents

1. [System Overview](#1-system-overview)
2. [Feasibility Study](#2-feasibility-study)
3. [System Requirements](#3-system-requirements)
4. [System Architecture](#4-system-architecture)
5. [Data Flow Diagrams (DFD)](#5-data-flow-diagrams-dfd)
6. [Entity Relationship Diagram (ER Diagram)](#6-entity-relationship-diagram)
7. [Use Case Diagram](#7-use-case-diagram)
8. [Activity Diagrams](#8-activity-diagrams)
9. [Sequence Diagrams](#9-sequence-diagrams)
10. [Database Design](#10-database-design)
11. [Input Design](#11-input-design)
12. [Output Design](#12-output-design)
13. [User Interface Design](#13-user-interface-design)
14. [Security Design](#14-security-design)
15. [Testing Strategy](#15-testing-strategy)

---

## 1. System Overview

### 1.1 Purpose

The Jewelry Business Intelligence System is designed to transform raw ERP data from jewelry businesses into actionable business insights. The system provides interactive dashboards, sales analytics, inventory intelligence, customer analytics, and demand prediction capabilities.

### 1.2 Scope

The system processes pre-existing business data (dummy datasets for academic purposes) and does **not** perform direct billing or transaction processing. It acts as an analytical layer on top of ERP-generated data.

### 1.3 System Boundary

```mermaid
flowchart LR
    subgraph External["External Systems"]
        ERP["ERP Software"]
        EXCEL["Excel Data Files"]
    end

    subgraph System["Jewelry BI System"]
        DB[(MySQL Database)]
        API["PHP Backend"]
        UI["Web Dashboard"]
    end

    subgraph Users["System Users"]
        OWNER["Business Owner"]
        MGR["Store Manager"]
        ANALYST["Data Analyst"]
    end

    EXCEL -->|Import Data| DB
    ERP -->|Export Data| EXCEL
    DB <-->|Queries| API
    API <-->|JSON/HTML| UI
    OWNER -->|View Reports| UI
    MGR -->|Monitor KPIs| UI
    ANALYST -->|Analyze Trends| UI
```

---

## 2. Feasibility Study

### 2.1 Technical Feasibility

| Criteria | Assessment | Status |
|----------|-----------|--------|
| Hardware availability | Standard PC/Laptop with 4GB+ RAM | ✅ Feasible |
| Software availability | All tools are free & open-source | ✅ Feasible |
| Technical expertise | HTML, CSS, JS, PHP, MySQL — BCA curriculum | ✅ Feasible |
| Development time | 3–4 months development cycle | ✅ Feasible |
| Internet requirement | Only for CDN libraries (Chart.js, Bootstrap) | ✅ Feasible |

### 2.2 Economic Feasibility

| Item | Cost |
|------|------|
| Development Tools (VS Code, DDEV, Git) | ₹0 (Free/Open-Source) |
| Server (Local Development via DDEV/Docker) | ₹0 |
| Database (MySQL via DDEV) | ₹0 |
| Libraries (Bootstrap, Chart.js) | ₹0 (Open-Source) |
| Domain & Hosting (if deployed) | ₹500–₹2000/year |
| **Total Estimated Cost** | **₹0 – ₹2000** |

### 2.3 Operational Feasibility

- The system uses a **web-based interface** accessible from any modern browser
- No special training required — intuitive dashboard design
- Uses standard web technologies familiar to users
- Can be operated on existing business hardware
- Minimal maintenance required once deployed

### 2.4 Schedule Feasibility

| Phase | Duration | Activities |
|-------|----------|------------|
| Phase 1: Planning & Analysis | 2 weeks | Requirements gathering, feasibility study |
| Phase 2: System Design | 2 weeks | ER diagrams, DFDs, UI mockups |
| Phase 3: Database Development | 1 week | Schema creation, data import |
| Phase 4: Backend Development | 3 weeks | PHP APIs, business logic |
| Phase 5: Frontend Development | 3 weeks | Dashboard UI, charts, interactivity |
| Phase 6: Testing & Debugging | 2 weeks | Unit testing, integration testing |
| Phase 7: Documentation | 1 week | Project report, user manual |
| **Total** | **~14 weeks** | |

---

## 3. System Requirements

### 3.1 Hardware Requirements

#### Development Environment

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| Processor | Intel i3 / AMD Ryzen 3 | Intel i5 / AMD Ryzen 5 |
| RAM | 4 GB | 8 GB |
| Storage | 10 GB free space | 20 GB free space |
| Display | 1366 × 768 | 1920 × 1080 |
| Network | Not required (local dev) | Broadband for CDN |

#### Client (End User)

| Component | Minimum |
|-----------|---------|
| Any device with modern web browser | Chrome 90+, Firefox 88+, Edge 90+ |
| Screen resolution | 1024 × 768 |
| Network | LAN/Internet access to server |

### 3.2 Software Requirements

#### Development

| Software | Version | Purpose |
|----------|---------|---------|
| Operating System | Windows 10+ / Ubuntu 20.04+ / macOS 12+ | Development OS |
| Docker Desktop | 4.0+ | Container runtime for DDEV |
| DDEV | 1.21+ | Local PHP development environment |
| Visual Studio Code | 1.80+ | Code editor |
| Git | 2.30+ | Version control |
| Web Browser | Chrome/Firefox/Edge (latest) | Testing & viewing |

#### Runtime Stack

| Technology | Version | Role |
|------------|---------|------|
| PHP | 8.1 | Server-side scripting |
| MySQL | 8.0 | Relational database |
| Nginx | Latest (via DDEV) | Web server |
| HTML5 | 5 | Page structure |
| CSS3 | 3 | Styling & layout |
| JavaScript | ES6+ | Client-side logic |
| Bootstrap | 5.3 | UI framework |
| Chart.js | 4.x | Data visualization |

### 3.3 Functional Requirements

| ID | Requirement | Priority | Module |
|----|-------------|----------|--------|
| FR-01 | Display business KPIs on dashboard | High | Dashboard |
| FR-02 | Show daily, monthly, yearly sales analysis | High | Sales |
| FR-03 | Display best-selling products | High | Sales |
| FR-04 | Show current stock with status indicators | High | Inventory |
| FR-05 | Detect dead stock (90+ days unsold) | Medium | Inventory |
| FR-06 | Generate restock recommendations | Medium | Inventory |
| FR-07 | Display customer segmentation | Medium | Customers |
| FR-08 | Calculate customer lifetime value | Medium | Customers |
| FR-09 | Forecast monthly sales (moving average) | Medium | Prediction |
| FR-10 | Export reports as CSV | Low | Reports |
| FR-11 | Interactive charts with filters | High | All modules |
| FR-12 | Responsive layout for different screens | High | UI |

### 3.4 Non-Functional Requirements

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-01 | Performance | Dashboard should load within 3 seconds |
| NFR-02 | Usability | Intuitive navigation, no training needed |
| NFR-03 | Compatibility | Works on Chrome, Firefox, Edge |
| NFR-04 | Scalability | Handles 1000+ products, 500+ customers |
| NFR-05 | Maintainability | Modular code structure for easy updates |
| NFR-06 | Reliability | System available 99% of uptime |

---

## 4. System Architecture

### 4.1 Three-Tier Architecture

The system follows a standard **Three-Tier Architecture**:

```mermaid
flowchart TB
    subgraph Tier1["Presentation Tier (Client)"]
        HTML["HTML5 Pages"]
        CSS["CSS3 / Bootstrap 5"]
        JS["JavaScript / Chart.js"]
    end

    subgraph Tier2["Application Tier (Server)"]
        PHP["PHP 8.1 Backend"]
        API["REST API Layer"]
        BL["Business Logic"]
    end

    subgraph Tier3["Data Tier (Database)"]
        MySQL[(MySQL 8.0)]
    end

    HTML <--> PHP
    CSS --> HTML
    JS <--> API
    API <--> BL
    BL <--> MySQL
```

### 4.2 Component Architecture

```mermaid
flowchart TB
    subgraph Frontend["Frontend Components"]
        direction TB
        NAV["Navigation (Sidebar + Header)"]
        DASH["Dashboard Module"]
        SALES["Sales Analytics Module"]
        INV["Inventory Module"]
        CUST["Customer Analytics Module"]
        RPT["Reports Module"]
        CHARTS["Chart.js Visualizations"]
    end

    subgraph Backend["Backend Components"]
        direction TB
        CONFIG["config.php - DB Config"]
        DBCONN["db.php - Connection Handler"]
        SAPI["sales.php - Sales API"]
        IAPI["inventory.php - Inventory API"]
        CAPI["customers.php - Customer API"]
        DAPI["dashboard.php - Dashboard API"]
    end

    subgraph Database["Database Layer"]
        direction TB
        T1["categories"]
        T2["products"]
        T3["inventory"]
        T4["customers"]
        T5["sales"]
        T6["sale_items"]
    end

    DASH --> DAPI
    SALES --> SAPI
    INV --> IAPI
    CUST --> CAPI
    CHARTS --> SAPI
    CHARTS --> DAPI

    SAPI --> DBCONN
    IAPI --> DBCONN
    CAPI --> DBCONN
    DAPI --> DBCONN
    DBCONN --> CONFIG
    DBCONN --> T1
    DBCONN --> T2
    DBCONN --> T3
    DBCONN --> T4
    DBCONN --> T5
    DBCONN --> T6
```

### 4.3 Directory Structure

```
jwellery/
├── index.php                  ← Entry Point
├── assets/                    ← Static Resources
│   ├── css/                   ← Stylesheets
│   ├── js/                    ← JavaScript files
│   └── images/                ← Static images
├── includes/                  ← Shared PHP Components
│   ├── config.php             ← DB Configuration
│   ├── db.php                 ← DB Connection
│   ├── header.php             ← Page Header
│   ├── sidebar.php            ← Navigation Sidebar
│   └── footer.php             ← Page Footer
├── modules/                   ← Feature Modules
│   ├── dashboard/             ← KPI Dashboard
│   ├── sales/                 ← Sales Analytics
│   ├── inventory/             ← Inventory Management
│   ├── customers/             ← Customer Analytics
│   └── reports/               ← Report Generation
├── api/                       ← Backend API Endpoints
│   ├── dashboard.php
│   ├── sales.php
│   ├── inventory.php
│   └── customers.php
└── sql/                       ← Database Scripts
    ├── schema.sql
    └── seed_data.sql
```

---

## 5. Data Flow Diagrams (DFD)

### 5.1 Context Diagram (Level 0 DFD)

The Context Diagram shows the system as a single process with its external entities.

```mermaid
flowchart LR
    ADMIN["👤 Admin / Manager"]
    ERP["📋 ERP Data Source"]
    SYSTEM(("Jewelry BI\nSystem"))

    ERP -->|"Business Data\n(Products, Sales,\nCustomers)"| SYSTEM
    ADMIN -->|"View Requests\n(Reports, Filters)"| SYSTEM
    SYSTEM -->|"Dashboards,\nCharts, Reports,\nAlerts"| ADMIN
```

**External Entities:**
- **Admin / Manager:** The primary user who views dashboards, reports, and analytics
- **ERP Data Source:** External system that provides business data via Excel exports

**Data Flows:**
- Business data (products, sales, customers) flows INTO the system
- Dashboards, charts, reports, and alerts flow OUT to the admin

---

### 5.2 Level 1 DFD

Level 1 breaks the system into its major processes.

```mermaid
flowchart TB
    ADMIN["👤 Admin / Manager"]
    ERP["📋 ERP Data"]
    DB[(Database)]

    P1["1.0\nData Import\n& Storage"]
    P2["2.0\nSales\nAnalysis"]
    P3["3.0\nInventory\nAnalysis"]
    P4["4.0\nCustomer\nAnalysis"]
    P5["5.0\nDashboard\nGeneration"]
    P6["6.0\nReport\nGeneration"]

    ERP -->|"Raw Excel Data"| P1
    P1 -->|"Structured Data"| DB

    DB -->|"Sales Records"| P2
    DB -->|"Inventory Data"| P3
    DB -->|"Customer Data"| P4

    P2 -->|"Sales Insights"| P5
    P3 -->|"Stock Alerts"| P5
    P4 -->|"Customer Segments"| P5

    P5 -->|"KPI Dashboard"| ADMIN
    P2 -->|"Sales Data"| P6
    P3 -->|"Inventory Data"| P6
    P4 -->|"Customer Data"| P6
    P6 -->|"CSV/Reports"| ADMIN

    ADMIN -->|"Filter Criteria"| P2
    ADMIN -->|"View Request"| P5
    ADMIN -->|"Export Request"| P6
```

**Processes:**

| Process | Name | Description |
|---------|------|-------------|
| 1.0 | Data Import & Storage | Import Excel data into MySQL database |
| 2.0 | Sales Analysis | Process sales transactions for insights |
| 3.0 | Inventory Analysis | Analyze stock levels, detect dead stock |
| 4.0 | Customer Analysis | Segment customers, calculate CLV |
| 5.0 | Dashboard Generation | Compile KPIs and generate dashboard |
| 6.0 | Report Generation | Generate downloadable reports |

---

### 5.3 Level 2 DFD — Sales Analysis (Process 2.0)

```mermaid
flowchart TB
    DB[(Database)]
    ADMIN["👤 Admin"]

    P21["2.1\nDaily Sales\nComputation"]
    P22["2.2\nMonthly Trend\nAnalysis"]
    P23["2.3\nYearly\nComparison"]
    P24["2.4\nBest Seller\nIdentification"]
    P25["2.5\nCategory-wise\nBreakdown"]
    P26["2.6\nDemand\nPrediction"]

    DB -->|"Sale Records"| P21
    DB -->|"Sale Records"| P22
    DB -->|"Sale Records"| P23
    DB -->|"Sale Items"| P24
    DB -->|"Sale Items +\nCategories"| P25
    P22 -->|"Historical Trends"| P26

    P21 -->|"Daily Report"| ADMIN
    P22 -->|"Monthly Charts"| ADMIN
    P23 -->|"Yearly Comparison"| ADMIN
    P24 -->|"Top Products List"| ADMIN
    P25 -->|"Category Charts"| ADMIN
    P26 -->|"Forecast Data"| ADMIN

    ADMIN -->|"Date Filters"| P21
    ADMIN -->|"Year Selection"| P23
```

---

### 5.4 Level 2 DFD — Inventory Analysis (Process 3.0)

```mermaid
flowchart TB
    DB[(Database)]
    ADMIN["👤 Admin"]

    P31["3.1\nStock Level\nMonitoring"]
    P32["3.2\nDead Stock\nDetection"]
    P33["3.3\nRestock\nRecommendation"]
    P34["3.4\nInventory\nValuation"]

    DB -->|"Product + Stock Data"| P31
    DB -->|"Sales + Stock Data"| P32
    DB -->|"Sales History +\nCurrent Stock"| P33
    DB -->|"Stock × Price"| P34

    P31 -->|"Stock Status\n(Low/OK/Over)"| ADMIN
    P32 -->|"Dead Stock List\nwith Locked Value"| ADMIN
    P33 -->|"Restock Qty\nRecommendation"| ADMIN
    P34 -->|"Total Inventory\nValue"| ADMIN

    P31 -->|"Low Stock Items"| P33
```

---

## 6. Entity Relationship Diagram

### 6.1 ER Diagram

```mermaid
erDiagram
    CATEGORIES ||--o{ PRODUCTS : "has"
    PRODUCTS ||--o| INVENTORY : "tracked in"
    CUSTOMERS ||--o{ SALES : "makes"
    SALES ||--o{ SALE_ITEMS : "contains"
    PRODUCTS ||--o{ SALE_ITEMS : "sold in"

    CATEGORIES {
        int category_id PK "Auto Increment"
        varchar category_name UK "Unique"
        text description "Nullable"
        datetime created_at "Default NOW"
    }

    PRODUCTS {
        int product_id PK "Auto Increment"
        int category_id FK "References categories"
        varchar product_name "NOT NULL"
        varchar sku UK "Unique Code"
        varchar metal_type "Gold/Silver/Platinum"
        decimal purity "e.g. 91.67 for 22K"
        decimal weight_grams "NOT NULL"
        decimal making_charges "Default 0"
        decimal cost_price "NOT NULL"
        decimal selling_price "NOT NULL"
        tinyint is_active "Default 1"
        datetime created_at "Default NOW"
        datetime updated_at "On Update"
    }

    INVENTORY {
        int inventory_id PK "Auto Increment"
        int product_id FK "References products (Unique)"
        int quantity_in_stock "Default 0"
        int reorder_level "Default 5"
        decimal stock_value "Computed"
        date last_restocked "Nullable"
        datetime updated_at "On Update"
    }

    CUSTOMERS {
        int customer_id PK "Auto Increment"
        varchar first_name "NOT NULL"
        varchar last_name "NOT NULL"
        varchar email "Unique, Nullable"
        varchar phone "NOT NULL"
        varchar city "Nullable"
        varchar state "Nullable"
        text address "Nullable"
        date date_of_birth "Nullable"
        date registration_date "NOT NULL"
        enum customer_type "Regular/Premium/VIP"
        datetime created_at "Default NOW"
    }

    SALES {
        int sale_id PK "Auto Increment"
        int customer_id FK "References customers"
        varchar invoice_number UK "Unique"
        date sale_date "NOT NULL"
        decimal subtotal "NOT NULL"
        decimal discount_percent "Default 0"
        decimal discount_amount "Default 0"
        decimal tax_percent "Default 3 GST"
        decimal tax_amount "Default 0"
        decimal total_amount "NOT NULL"
        enum payment_method "Cash/Card/UPI/etc."
        enum payment_status "Paid/Pending/Partial"
        datetime created_at "Default NOW"
    }

    SALE_ITEMS {
        int sale_item_id PK "Auto Increment"
        int sale_id FK "References sales"
        int product_id FK "References products"
        int quantity "Default 1"
        decimal unit_price "NOT NULL"
        decimal discount "Default 0"
        decimal total_price "NOT NULL"
    }
```

### 6.2 Cardinality Summary

| Relationship | Type | Description |
|-------------|------|-------------|
| Categories → Products | One-to-Many (1:M) | One category has many products |
| Products → Inventory | One-to-One (1:1) | Each product has one inventory record |
| Customers → Sales | One-to-Many (1:M) | One customer can make many purchases |
| Sales → Sale Items | One-to-Many (1:M) | One sale has many line items |
| Products → Sale Items | One-to-Many (1:M) | One product appears in many sale items |

### 6.3 Data Dictionary

#### Table: products

| Attribute | Data Type | Size | Constraint | Description |
|-----------|----------|------|------------|-------------|
| product_id | INT | 11 | Primary Key, Auto Increment | Unique product identifier |
| category_id | INT | 11 | Foreign Key → categories | Product category reference |
| product_name | VARCHAR | 200 | NOT NULL | Display name of product |
| sku | VARCHAR | 50 | UNIQUE, NOT NULL | Stock Keeping Unit code (e.g., CH01, RG29) |
| metal_type | VARCHAR | 50 | NOT NULL | Type: Gold, Silver, Platinum |
| purity | DECIMAL | 5,2 | NULL | Purity percentage (22K = 91.67%) |
| weight_grams | DECIMAL | 10,3 | NOT NULL | Product weight in grams |
| making_charges | DECIMAL | 10,2 | DEFAULT 0 | Manufacturing charges in ₹ |
| cost_price | DECIMAL | 12,2 | NOT NULL | Cost/purchase price in ₹ |
| selling_price | DECIMAL | 12,2 | NOT NULL | Retail selling price in ₹ |
| is_active | TINYINT | 1 | DEFAULT 1 | Active (1) or Inactive (0) |
| created_at | DATETIME | — | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | DATETIME | — | ON UPDATE CURRENT_TIMESTAMP | Last modification timestamp |

#### Table: sales

| Attribute | Data Type | Size | Constraint | Description |
|-----------|----------|------|------------|-------------|
| sale_id | INT | 11 | Primary Key, Auto Increment | Unique sale identifier |
| customer_id | INT | 11 | Foreign Key → customers | Buyer reference |
| invoice_number | VARCHAR | 50 | UNIQUE, NOT NULL | Invoice reference (e.g., INV-2024-001) |
| sale_date | DATE | — | NOT NULL | Transaction date |
| subtotal | DECIMAL | 14,2 | NOT NULL | Pre-tax, pre-discount total |
| discount_percent | DECIMAL | 5,2 | DEFAULT 0 | Discount percentage applied |
| discount_amount | DECIMAL | 12,2 | DEFAULT 0 | Discount amount in ₹ |
| tax_percent | DECIMAL | 5,2 | DEFAULT 3.00 | GST rate |
| tax_amount | DECIMAL | 12,2 | DEFAULT 0 | Tax amount in ₹ |
| total_amount | DECIMAL | 14,2 | NOT NULL | Final payable amount in ₹ |
| payment_method | ENUM | — | NOT NULL | Cash / Card / UPI / Bank Transfer / EMI |
| payment_status | ENUM | — | DEFAULT 'Paid' | Paid / Pending / Partial |

---

## 7. Use Case Diagram

### 7.1 System Use Cases

```mermaid
flowchart TB
    subgraph Actors
        ADMIN["👤 Admin/Manager"]
    end

    subgraph System["Jewelry BI System"]
        UC1["View Dashboard KPIs"]
        UC2["Analyze Sales Trends"]
        UC3["View Best Sellers"]
        UC4["Monitor Inventory"]
        UC5["Detect Dead Stock"]
        UC6["Get Restock Alerts"]
        UC7["Analyze Customers"]
        UC8["View Premium Customers"]
        UC9["Forecast Demand"]
        UC10["Generate Reports"]
        UC11["Export CSV"]
        UC12["Filter Data by Date"]
    end

    ADMIN --> UC1
    ADMIN --> UC2
    ADMIN --> UC3
    ADMIN --> UC4
    ADMIN --> UC5
    ADMIN --> UC6
    ADMIN --> UC7
    ADMIN --> UC8
    ADMIN --> UC9
    ADMIN --> UC10
    ADMIN --> UC11
    ADMIN --> UC12

    UC2 -.->|"includes"| UC12
    UC10 -.->|"extends"| UC11
    UC4 -.->|"includes"| UC5
    UC4 -.->|"includes"| UC6
```

### 7.2 Use Case Descriptions

#### UC-01: View Dashboard KPIs

| Field | Description |
|-------|-------------|
| **Use Case ID** | UC-01 |
| **Name** | View Dashboard KPIs |
| **Actor** | Admin / Manager |
| **Precondition** | Data is imported into database |
| **Main Flow** | 1. User opens the application<br>2. System loads the dashboard page<br>3. System queries database for KPI metrics<br>4. System calculates Total Revenue, Orders, Customers, Profit<br>5. System renders KPI cards and charts<br>6. User views the dashboard |
| **Postcondition** | Dashboard displays current business KPIs |
| **Alternate Flow** | If database is empty, show "No data available" message |

#### UC-05: Detect Dead Stock

| Field | Description |
|-------|-------------|
| **Use Case ID** | UC-05 |
| **Name** | Detect Dead Stock |
| **Actor** | Admin / Manager |
| **Precondition** | Products and sales data exist in database |
| **Main Flow** | 1. User navigates to Inventory → Dead Stock<br>2. System queries products not sold in 90+ days<br>3. System calculates locked inventory value<br>4. System displays dead stock list with last sale date<br>5. User reviews and takes action |
| **Postcondition** | Dead stock products are listed with recommendations |

#### UC-09: Forecast Demand

| Field | Description |
|-------|-------------|
| **Use Case ID** | UC-09 |
| **Name** | Forecast Demand |
| **Actor** | Admin / Manager |
| **Precondition** | At least 3 months of sales data exists |
| **Main Flow** | 1. User navigates to Sales → Forecast<br>2. System retrieves historical monthly sales<br>3. System calculates 3-month moving average<br>4. System projects next 3 months<br>5. System displays forecast chart (actual vs predicted)<br>6. User uses data for inventory planning |
| **Postcondition** | Sales forecast is displayed with predicted values |

---

## 8. Activity Diagrams

### 8.1 Dashboard Loading Activity

```mermaid
flowchart TD
    START(["Start"]) --> A["User opens application"]
    A --> B["System loads index.php"]
    B --> C["Include header, sidebar, footer"]
    C --> D["JavaScript sends AJAX request to API"]
    D --> E["PHP API connects to MySQL"]
    E --> F{"Data available?"}
    F -->|Yes| G["Execute KPI queries"]
    F -->|No| H["Return empty state"]
    G --> I["Calculate metrics"]
    I --> J["Return JSON response"]
    H --> J
    J --> K["JavaScript receives data"]
    K --> L["Render KPI cards"]
    L --> M["Initialize Chart.js charts"]
    M --> N["Display dashboard"]
    N --> STOP(["End"])
```

### 8.2 Sales Analysis Activity

```mermaid
flowchart TD
    START(["Start"]) --> A["User navigates to Sales"]
    A --> B["Select analysis type"]
    B --> C{"Which type?"}
    C -->|Daily| D["Set date = today"]
    C -->|Monthly| E["Set month/year filter"]
    C -->|Yearly| F["Set year comparison"]
    D --> G["Query daily sales"]
    E --> H["Query monthly aggregates"]
    F --> I["Query yearly summaries"]
    G --> J["Process results"]
    H --> J
    I --> J
    J --> K["Format data for charts"]
    K --> L["Render tables & charts"]
    L --> M{"Export requested?"}
    M -->|Yes| N["Generate CSV"]
    N --> O["Download file"]
    M -->|No| STOP(["End"])
    O --> STOP
```

### 8.3 Dead Stock Detection Activity

```mermaid
flowchart TD
    START(["Start"]) --> A["User opens Dead Stock page"]
    A --> B["System sets threshold = 90 days"]
    B --> C["Query: Products with last_sale_date > 90 days ago"]
    C --> D["Join products + inventory + sales"]
    D --> E["Calculate days since last sale"]
    E --> F["Calculate locked value per product"]
    F --> G["Sort by days descending"]
    G --> H["Display dead stock table"]
    H --> I{"Products found?"}
    I -->|Yes| J["Show product list with actions"]
    I -->|No| K["Show 'No dead stock' message"]
    J --> L["Show total locked value summary"]
    L --> STOP(["End"])
    K --> STOP
```

---

## 9. Sequence Diagrams

### 9.1 Dashboard Loading Sequence

```mermaid
sequenceDiagram
    actor User as Admin/Manager
    participant Browser as Web Browser
    participant PHP as PHP Backend
    participant API as API Layer
    participant DB as MySQL Database

    User->>Browser: Open dashboard URL
    Browser->>PHP: GET /modules/dashboard/
    PHP->>Browser: Return HTML (header + sidebar + main)
    Browser->>API: AJAX GET /api/dashboard.php
    API->>DB: SELECT SUM(total_amount) FROM sales
    DB-->>API: Revenue data
    API->>DB: SELECT COUNT(*) FROM sales
    DB-->>API: Order count
    API->>DB: SELECT COUNT(*) FROM customers
    DB-->>API: Customer count
    API->>DB: SELECT SUM(stock_value) FROM inventory
    DB-->>API: Inventory value
    API-->>Browser: JSON { kpis, charts }
    Browser->>Browser: Render KPI cards
    Browser->>Browser: Initialize Chart.js
    Browser-->>User: Display complete dashboard
```

### 9.2 Report Export Sequence

```mermaid
sequenceDiagram
    actor User as Admin/Manager
    participant Browser as Web Browser
    participant PHP as PHP Backend
    participant DB as MySQL Database

    User->>Browser: Click "Export CSV" button
    Browser->>PHP: GET /modules/reports/export.php?type=sales
    PHP->>DB: SELECT sales data with joins
    DB-->>PHP: Result set
    PHP->>PHP: Format as CSV
    PHP->>PHP: Set headers (Content-Type: text/csv)
    PHP-->>Browser: CSV file download
    Browser-->>User: File saved to downloads
```

### 9.3 Restock Recommendation Sequence

```mermaid
sequenceDiagram
    actor User as Admin/Manager
    participant Browser as Web Browser
    participant API as API Layer
    participant DB as MySQL Database

    User->>Browser: Open Restock page
    Browser->>API: GET /api/inventory.php?type=restock
    API->>DB: Query current stock levels
    DB-->>API: Stock data
    API->>DB: Query average monthly sales
    DB-->>API: Sales velocity data
    API->>API: Calculate safety stock
    API->>API: Calculate recommended qty
    API->>API: Estimate restock cost
    API-->>Browser: JSON { restock_items }
    Browser->>Browser: Render recommendation table
    Browser-->>User: Display restock suggestions
```

---

## 10. Database Design

### 10.1 Normalization

The database follows **Third Normal Form (3NF)**:

**First Normal Form (1NF):**
- All columns contain atomic (single) values
- Each row is uniquely identified by a primary key
- No repeating groups

**Second Normal Form (2NF):**
- Satisfies 1NF
- All non-key columns depend on the entire primary key
- No partial dependencies (sale_items separated from sales)

**Third Normal Form (3NF):**
- Satisfies 2NF
- No transitive dependencies
- Category details stored in separate `categories` table
- Customer details separated from sales transactions

### 10.2 Table Relationships

| Parent Table | Child Table | Relationship | FK Column |
|-------------|------------|--------------|-----------|
| categories | products | 1:M | category_id |
| products | inventory | 1:1 | product_id |
| customers | sales | 1:M | customer_id |
| sales | sale_items | 1:M | sale_id |
| products | sale_items | 1:M | product_id |

### 10.3 Data Mapping (Excel → Database)

| Source File | Target Table(s) | Mapping |
|-------------|-----------------|---------|
| Dummy_Jewellery_Inventory.xlsx | products, inventory, categories | Product Code → sku, Category → categories.category_name, Purity/Color/Weight → products, Stock derived for inventory |
| Jaipur_Focused_Customer_Report.xlsx | customers | Customer ID → customer_id, Name split → first_name + last_name, City/State/Address direct map |
| Jewellery_Sales_Report_2024_2026_Sorted.xlsx | sales, sale_items | Invoice Date → sale_date, Product Code → product_id (via sku), Sale Value → total_amount, Making Charges direct map |

---

## 11. Input Design

### 11.1 Input Screens

The system primarily receives input through **filter controls** and **navigation** (not data entry forms, since data is imported from ERP).

#### Date Range Filter

| Field | Type | Validation | Default |
|-------|------|-----------|---------|
| Start Date | Date Picker | Must be ≤ End Date | First day of current month |
| End Date | Date Picker | Must be ≥ Start Date | Today |

#### Category Filter

| Field | Type | Options | Default |
|-------|------|---------|---------|
| Category | Dropdown | All categories from DB | "All Categories" |

#### Analysis Type Selector

| Field | Type | Options | Default |
|-------|------|---------|---------|
| View By | Radio/Tabs | Daily / Monthly / Yearly | Monthly |

### 11.2 Input Validation Rules

| Rule | Description |
|------|-------------|
| Date Range | End date cannot be before start date |
| Category | Must be a valid category from database |
| Numeric Filters | Must be positive numbers |
| Search Text | Sanitized to prevent SQL injection |

---

## 12. Output Design

### 12.1 Dashboard Output

```
┌─────────────────────────────────────────────────────────────┐
│  💎 Jewelry Business Intelligence Dashboard                 │
├──────────┬──────────┬──────────┬──────────┬────────────────┤
│ 💰       │ 📦       │ 👥       │ 🏪       │ 📈             │
│ Revenue  │ Orders   │ Customers│ Inv Value│ Growth         │
│ ₹1.54Cr  │ 342      │ 156      │ ₹87.5L   │ +12.5%         │
├──────────┴──────────┴──────────┴──────────┴────────────────┤
│                                                             │
│  Monthly Revenue Trend          Category-wise Sales         │
│  ┌─────────────────┐           ┌─────────────────┐         │
│  │  📈 Line Chart  │           │  🍩 Donut Chart │         │
│  │                 │           │                 │         │
│  └─────────────────┘           └─────────────────┘         │
│                                                             │
│  Recent Sales                   Top Products                │
│  ┌─────────────────┐           ┌─────────────────┐         │
│  │  📋 Data Table  │           │  📊 Bar Chart   │         │
│  │                 │           │                 │         │
│  └─────────────────┘           └─────────────────┘         │
└─────────────────────────────────────────────────────────────┘
```

### 12.2 Report Outputs

| Report Type | Format | Fields |
|-------------|--------|--------|
| Sales Summary | Screen + CSV | Date, Invoice, Customer, Products, Amount |
| Inventory Status | Screen + CSV | Product, Category, Stock, Status, Value |
| Customer Analysis | Screen + CSV | Name, City, Orders, Total Spent, CLV |
| Dead Stock | Screen + CSV | Product, Category, Days Unsold, Locked Value |
| Restock | Screen + CSV | Product, Current Stock, Avg Sales, Recommended Qty |

### 12.3 Chart Outputs

| Chart | Type | X-Axis | Y-Axis | Data Source |
|-------|------|--------|--------|-------------|
| Revenue Trend | Line | Months | Revenue (₹) | sales.total_amount |
| Category Sales | Doughnut | — | % Share | sale_items by category |
| Daily Sales | Area | Days | Revenue (₹) | sales.sale_date |
| Top Products | Horizontal Bar | Products | Revenue (₹) | sale_items aggregate |
| Stock Status | Pie | — | Count | inventory.status |
| Customer Distribution | Bar | Cities | Count | customers.city |

---

## 13. User Interface Design

### 13.1 Layout Design

The application uses a **sidebar navigation layout** common in admin dashboards:

```
┌──────────────────────────────────────────────────────┐
│  HEADER BAR (Logo + Title + User Info)                │
├──────────┬───────────────────────────────────────────┤
│          │                                           │
│ SIDEBAR  │          MAIN CONTENT AREA                │
│          │                                           │
│ Dashboard│  ┌─────────────────────────────────────┐  │
│ Sales    │  │                                     │  │
│ Inventory│  │        KPI Cards / Charts /         │  │
│ Customers│  │        Data Tables                  │  │
│ Reports  │  │                                     │  │
│          │  └─────────────────────────────────────┘  │
│          │                                           │
├──────────┴───────────────────────────────────────────┤
│  FOOTER (Copyright + Version)                        │
└──────────────────────────────────────────────────────┘
```

### 13.2 CSS Strategy: Bootstrap First

> **Rule:** Use Bootstrap 5 classes for EVERYTHING possible. Write custom CSS ONLY when Bootstrap cannot do it.

| Need | Bootstrap? | Custom CSS? |
|------|:-:|:-:|
| Cards, padding, margins, grid | ✅ Bootstrap | ❌ No |
| Tables (striped, hover, responsive) | ✅ Bootstrap | ❌ No |
| Buttons, badges, alerts, colors | ✅ Bootstrap | ❌ No |
| Navbar, dropdowns, modals | ✅ Bootstrap | ❌ No |
| Text sizes, font weights, spacing | ✅ Bootstrap | ❌ No |
| Sidebar width & transitions | ❌ Not in Bootstrap | ✅ custom.css |
| Chart container sizing | ❌ Not in Bootstrap | ✅ custom.css |
| Custom scrollbar, glassmorphism | ❌ Not in Bootstrap | ✅ custom.css |

**CSS Files (only 2 files):**
- `variables.css` — Theme CSS custom properties (~30 lines)
- `custom.css` — Only what Bootstrap can't do (~100-150 lines max)

For full coding standards, see `CODING_STANDARDS.md`.

### 13.3 Color Scheme (via Bootstrap + CSS Variables)

| Element | Color | Hex Code | Usage |
|---------|-------|----------|-------|
| Primary | Indigo | `#6366f1` | Buttons, active links, accents |
| Secondary | Slate | `#475569` | Text, borders |
| Success | Emerald | `#22c55e` | Positive metrics, stock OK |
| Warning | Amber | `#f59e0b` | Low stock alerts, caution |
| Danger | Red | `#ef4444` | Out of stock, negative trends |
| Background | Dark Slate | `#0f172a` | Page background (dark mode) |
| Surface | Dark Blue | `#1e293b` | Card backgrounds |
| Text Primary | White | `#f8fafc` | Main text |
| Text Muted | Gray | `#94a3b8` | Secondary text |

### 13.4 Typography (Google Fonts: Inter)

| Element | Bootstrap Class | Size |
|---------|----------------|------|
| Page Title | `.h3 .fw-bold` | 24px |
| Section Title | `.h5 .fw-semibold` | 20px |
| Body Text | Default | 16px |
| KPI Values | `.display-6 .fw-bold` | 28-36px |
| Labels | `.small .text-muted .text-uppercase` | 12-13px |
| Table Data | Default `.table` | 14px |

### 13.5 Component Specifications

#### KPI Card (100% Bootstrap classes)

```html
<div class="card border-0 shadow-sm rounded-3 h-100">
  <div class="card-body p-4">
    <div class="d-flex align-items-center mb-3">
      <div class="bg-primary bg-opacity-10 rounded-3 p-2 me-3">
        <i class="bi bi-currency-rupee text-primary fs-4"></i>
      </div>
      <span class="text-muted fw-semibold small text-uppercase">Revenue</span>
    </div>
    <h3 class="fw-bold mb-1">₹1,54,20,000</h3>
    <span class="badge bg-success-subtle text-success">▲ 12.5%</span>
  </div>
</div>
```

#### Navigation Sidebar (Bootstrap Offcanvas + Nav)

Uses Bootstrap's `nav-pills`, `list-group`, and responsive collapse.
Only custom CSS needed: fixed width (260px/70px) and transition.

### 13.5 Responsive Breakpoints

| Breakpoint | Width | Layout Changes |
|-----------|-------|---------------|
| Desktop | ≥ 1200px | Full sidebar + 4-column KPI grid |
| Tablet | 768px – 1199px | Collapsed sidebar + 2-column grid |
| Mobile | < 768px | Hidden sidebar (hamburger menu) + 1-column |

---

## 14. Security Design

### 14.1 Security Measures

| Threat | Mitigation |
|--------|-----------|
| SQL Injection | Use PDO Prepared Statements for all queries |
| XSS (Cross-Site Scripting) | Sanitize all output with `htmlspecialchars()` |
| CSRF | Not applicable (read-only dashboard, no form submissions) |
| Direct File Access | Restrict access to `includes/` via `.htaccess` |
| Database Credentials | Store in `config.php` outside web root or use environment variables |

### 14.2 PHP Security Practices

```php
// ✅ CORRECT: Using Prepared Statements
$stmt = $pdo->prepare("SELECT * FROM products WHERE category_id = ?");
$stmt->execute([$category_id]);

// ❌ WRONG: Direct variable interpolation
$result = $pdo->query("SELECT * FROM products WHERE category_id = $id");

// ✅ CORRECT: Output sanitization
echo htmlspecialchars($product_name, ENT_QUOTES, 'UTF-8');
```

---

## 15. Testing Strategy

### 15.1 Testing Levels

| Level | Scope | Method |
|-------|-------|--------|
| Unit Testing | Individual PHP functions | Manual test with sample data |
| Integration Testing | API endpoints + Database | Test API responses via browser/Postman |
| System Testing | Complete application flow | End-to-end scenario testing |
| UI Testing | Visual correctness | Cross-browser testing |
| Performance Testing | Load time & response time | Browser DevTools |

### 15.2 Test Cases

| Test ID | Module | Test Case | Expected Result | Status |
|---------|--------|-----------|-----------------|--------|
| TC-01 | Dashboard | Load dashboard page | KPIs display within 3 seconds | ⬜ |
| TC-02 | Dashboard | Verify revenue calculation | Matches SUM of sales.total_amount | ⬜ |
| TC-03 | Sales | Filter by date range | Only filtered data displayed | ⬜ |
| TC-04 | Sales | View monthly trend chart | Line chart renders correctly | ⬜ |
| TC-05 | Inventory | Check low stock alert | Products with stock ≤ reorder_level shown | ⬜ |
| TC-06 | Inventory | Dead stock detection | Products unsold 90+ days listed | ⬜ |
| TC-07 | Inventory | Restock recommendation | Recommended qty is calculated correctly | ⬜ |
| TC-08 | Customers | Customer segmentation | Segments match spending criteria | ⬜ |
| TC-09 | Customers | CLV calculation | CLV = AOV × Frequency × Lifespan | ⬜ |
| TC-10 | Reports | Export CSV | Valid CSV file downloads | ⬜ |
| TC-11 | UI | Responsive layout | Works on 1920px, 1366px, 768px, 375px | ⬜ |
| TC-12 | Security | SQL injection attempt | Query is sanitized, no error | ⬜ |

### 15.3 Browser Compatibility

| Browser | Version | Status |
|---------|---------|--------|
| Google Chrome | 90+ | ⬜ To Test |
| Mozilla Firefox | 88+ | ⬜ To Test |
| Microsoft Edge | 90+ | ⬜ To Test |
| Safari | 14+ | ⬜ To Test |

---

## 📎 Appendix

### A. Abbreviations

| Abbreviation | Full Form |
|-------------|-----------|
| BI | Business Intelligence |
| ERP | Enterprise Resource Planning |
| KPI | Key Performance Indicator |
| DFD | Data Flow Diagram |
| ER | Entity Relationship |
| CLV | Customer Lifetime Value |
| AOV | Average Order Value |
| GST | Goods and Services Tax |
| CSV | Comma Separated Values |
| API | Application Programming Interface |
| AJAX | Asynchronous JavaScript and XML |
| PDO | PHP Data Objects |
| SQL | Structured Query Language |
| CRUD | Create, Read, Update, Delete |
| UI | User Interface |
| UX | User Experience |

### B. References

1. Pressman, R. S. — *Software Engineering: A Practitioner's Approach*
2. Elmasri, R. & Navathe, S. B. — *Fundamentals of Database Systems*
3. Chart.js Documentation — https://www.chartjs.org/docs/
4. Bootstrap 5 Documentation — https://getbootstrap.com/docs/5.3/
5. PHP Official Documentation — https://www.php.net/docs.php
6. MySQL Reference Manual — https://dev.mysql.com/doc/
7. DDEV Documentation — https://ddev.readthedocs.io/
