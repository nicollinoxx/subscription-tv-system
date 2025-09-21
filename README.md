# 🎬 Pay-System

A Ruby on Rails application for managing subscription-based TV services.  
This system allows managing subscription plans, packages, optional services, customers, subscriptions, and automatic generation of invoices and billing booklets.

---

## ✨ Features

- **Subscription Plans:** Create and manage plans with monthly pricing.
- **Optional Services:** Register services such as Premiere and Plus. 
- **Packages:** Combine plans and optional services into packages.
- **Customer Management:** Store customer personal information. 
- **Subscriptions:**  
  - Enforce business rules (plan OR package required; no duplicate optional services).
  - Automatically generate 12 monthly invoices per subscription.
  - Generate billing booklets with all invoices.
- **Interface:** View subscriptions, invoices, and booklets.

---

## 🛠️ Technologies

- **Ruby 3.x**  
- **Rails 8.x**  
- **SQLite**  
- **Minitest** for testing  
