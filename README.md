# 📚 EduSphere: Student Portal (SDG 4: Quality Education)

A feature-rich, 4-screen Flutter student portal application designed to promote **Sustainable Development Goal 4 (Quality Education)** by providing accessible micro-learning resources, clean navigation, and dynamic user data handling.

🌐 **Live Deployed App:** [https://flutterproject-i1p0.onrender.com/](https://flutterproject-i1p0.onrender.com/)

---

## 📱 App Architecture & 4-Screen Flow

The application is structured around a seamless imperative routing model using standard `Navigator.push` and `Navigator.pop` methods with explicit constructor-based data passing.

1. **🔐 Login Screen**
   * Clean, modern authentication interface with input fields for Username and Password.
   * Basic validation ensuring fields are not left empty.
   * Navigates to the Home Screen using `Navigator.push`, dynamically passing the entered username string as data.

2. **🏠 Home Screen**
   * Displays a personalized welcome message utilizing the username passed from the login screen.
   * Features dashboard overview metrics emphasizing SDG 4 (e.g., Accessible Lessons, Global Learners).
   * Quick-action buttons to access the **Courses Screen** and **Profile Screen**.
   * Logout functionality returning securely to the Login Screen via `Navigator.pop` / `Navigator.pushReplacement`.

3. **📖 Courses Screen**
   * Showcases a list of sustainable development and technology micro-courses (e.g., *Digital Literacy Basics*, *Renewable Energy 101*, *Coding for Good*).
   * Clean card layout highlighting lesson descriptions and progress indicators.
   * Easy return navigation back to the Home Screen using `Navigator.pop`.

4. **👤 Profile Screen**
   * Displays student profile details, including the dynamic username, a simulated student ID, enrolled courses count, and an **SDG 4 Learner Badge**.
   * Quick navigation back to the Home Screen via `Navigator.pop`.

---

## 🛠️ Flutter Concepts & Technical Highlights

* **Navigation & Routing:** Utilizes imperative Flutter routing (`Navigator.push`, `Navigator.pop`) for straightforward screen transitions.
* **Data Passing:** Implements constructor-based state transfer (passing variables seamlessly across screen constructors like `HomeScreen(username: _username)`).
* **Widget Composition:** Leveraged `StatelessWidget` and `StatefulWidget` effectively alongside Material 3 UI design principles (`Scaffold`, `AppBar`, `ListView.builder`, `Card`, and custom padding/elevations).
* **Responsive Layout:** Designed to scale fluidly across mobile web views and desktop browsers.

---

## 🌍 SDG 4 (Quality Education) Relevance

This project actively aligns with **United Nations Sustainable Development Goal 4** by:
* Promoting inclusive and equitable quality education through digital micro-learning platforms.
* Highlighting technology, sustainability, and digital literacy topics within the curriculum catalog.
* Providing a frictionless user experience designed for diverse learners globally.

---

## 🚀 Getting Started Locally

If you want to run or test this project locally on your machine using Flutter:

### Prerequisites
* Ensure you have the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed (Dart 3.0+ recommended).
* A code editor like [Visual Studio Code](https://code.visualstudio.com/) or Android Studio.

### Installation Steps
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/flutter-student-portal.git](https://github.com/your-username/flutter-student-portal.git)
   cd flutter-student-portal
