# Smart Campus Notice Board 📱🎓

A modern, responsive Flutter application designed to display college announcements, circulars, and event updates in a clean, organized interface. Built specifically to run seamlessly on web and mobile environments like **FlutLab.io**.

---

## 🌐 Live Demo
You can access and test the live web version of the application here:
🔗 **[Smart Campus Notice Board - Deployed Link](https://flutterproject-i1p0.onrender.com/)**

---

## 🌟 Features

* **Dynamic Notice Feed:** Displays multiple categories of college announcements (e.g., Academic, Events, Placements).
* **Rich Layout Structures:** Utilizes advanced Flutter layout primitives (`Row`, `Column`, and `Stack`) to create layered, card-based UI components.
* **Visual Media Support:** Integrates high-quality banner images alongside textual information for enhanced visual engagement.
* **Priority Badge Overlays:** Uses `Stack` and positioning widgets to display real-time status or priority tags (e.g., "URGENT") over notice images.
* **Modern Material Design:** Leverages customized `Container` widgets with rounded borders, margins, padding, and subtle shadows.

---

## 🧩 Flutter Widgets & Layouts Used

The project fulfills all core architectural and UI criteria through the following implementation:

| Category | Widgets Used | Purpose in the App |
| :--- | :--- | :--- |
| **Content Widgets** | `Text`, `Image.network`, `Container` | Display notice titles, descriptions, timestamps, category banners, and handle custom card styling/backgrounds. |
| **Layout Widgets** | `Column`, `Row`, `Stack` | Structure vertical feed elements (`Column`), align horizontal metadata like dates (`Row`), and layer badge overlays on top of images (`Stack`). |
| **Scroll & Structure** | `ListView.builder`, `Scaffold`, `AppBar` | Ensure smooth scrolling across multiple announcements within a standard material app framework. |

---

## 🚀 How to Run on FlutLab.io

1. Log into your account on [FlutLab.io](https://flutlab.io/).
2. Create a new Flutter project or open your existing **Smart Campus Notice Board** project workspace.
3. Replace the contents of your `lib/main.dart` file with the provided source code.
4. Click the **Build** or **Run** button in FlutLab to launch the application directly in your browser.

---

## 📂 Project Structure

```text
smart_campus_notice_board/
│
├── lib/
│   └── main.dart       # Main application file containing all UI logic, data models, and widgets
├── pubspec.yaml        # Project dependencies and configuration
└── README.md           # Project documentation
