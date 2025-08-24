# Thmanyah App

This project is built using **Swift** and follows the **MVVM (Model-View-ViewModel)** architecture pattern, with a clear modular structure for scalability and maintainability.

## Building and running the project (requirements)
* Swift 5.9
* Xcode 16.0+
* iOS 18.0+

## Setup Configs
- Checkout main branch to run latest version
- Open the terminal.
- Navigate to the project root directory.
- Open the project by double clicking the `ThmanyahApp.xcworkspace` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app

---

## 📐 Architecture Overview

The project is organized into **vertical modularity**, where each concern is placed into a dedicated Swift Package or module.

### 1. **Domain Layer**

* Defines the **business logic** and **entities** (pure Swift models).
* Divided into:

  * **Domain** → Defines entities and use cases (no dependency on other layers).
  * **Central** → Implements the domain by converting raw responses (from the Network layer) into entities that are used by the Presentation layer.

### 2. **Data Layer**

* Represented by the **Network package**.
* Contains:

  * API Clients (responsible for making requests).
  * Response Models (raw API responses).
* Converts raw data into entities via the Central module.

### 3. **Presentation Layer**

* Implemented in separate feature packages (e.g., `Home`, `Search`).
* Each feature follows **MVVM**:

  * **Model** → Domain entities.
  * **ViewModel** → Coordinates between Views and Use Cases.
  * **View** → SwiftUI screens.
* Keeps UI logic separate and reusable across the app.

### 4. **Target App**

* Hosts the **Routing Layer**.
* Responsible for navigation (e.g., `AppRouter`, `HomeRouter`).
* Coordinates between feature modules to display screens.

---

## 📦 Example Module Setup

```
ThmanyahApp (Target App)
│
├── Domain (Entities, Use Cases)
├── Central (Implements Domain, maps Network → Entities)
├── Network (API Clients, DTOs, Responses)
├── Home (Feature Package: MVVM)
└── Search (Feature Package: MVVM)
```

---

## 🧭 Navigation

* Navigation is handled in the **Target App** through routers.
* Example:

  * `HomeRouter` → Handles navigation inside the Home feature.
  * `AppRouter` → Manages global navigation across modules.

---

## ✅ Key Points

* **MVVM** pattern applied consistently.
* **Vertical modularity** ensures separation of concerns.
* **Domain-centric design** → Presentation depends on Domain, not on raw Network responses.
* **Scalability** → Each feature can be developed, tested, and extended independently.
