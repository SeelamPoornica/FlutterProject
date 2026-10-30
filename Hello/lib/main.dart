// ============================================================
// Student Portal
// Single-file Flutter app (Material 3) for FlutLab.io
// Screens: Login <-> Sign Up -> Home -> Courses / Profile
// ============================================================

import 'package:flutter/material.dart';

void main() => runApp(const StudentPortalApp());

// ------------------------------------------------------------
// Shared colors (deep blue + teal palette)
// ------------------------------------------------------------
const Color kDeepBlue = Color(0xFF0D3B66);
const Color kTeal = Color(0xFF14A3A3);
const Color kLightBg = Color(0xFFF2F7FA);

// ------------------------------------------------------------
// Helper: build initials from a name
// e.g. "john doe" -> "JD", "alex" -> "AL"
// ------------------------------------------------------------
String getInitials(String name) {
  final parts = name
      .trim()
      .split(RegExp(r'[\s._-]+'))
      .where((part) => part.isNotEmpty)
      .toList();
  if (parts.isEmpty) return '?';
  if (parts.length == 1) {
    final word = parts.first;
    return (word.length >= 2 ? word.substring(0, 2) : word).toUpperCase();
  }
  return (parts[0][0] + parts[1][0]).toUpperCase();
}

// ------------------------------------------------------------
// Data model for a course
// ------------------------------------------------------------
class Course {
  final String title;
  final String description;
  final String duration;
  final String level;
  final IconData icon;

  const Course({
    required this.title,
    required this.description,
    required this.duration,
    required this.level,
    required this.icon,
  });
}

// Sample micro-courses
const List<Course> kCourses = [
  Course(
    title: 'Digital Literacy Basics',
    description:
        'Build essential skills for using computers, the internet and online '
        'tools safely and confidently.',
    duration: '4 weeks',
    level: 'Beginner',
    icon: Icons.computer,
  ),
  Course(
    title: 'Renewable Energy 101',
    description:
        'Learn how solar, wind and hydro power work and why clean energy '
        'matters for communities.',
    duration: '3 weeks',
    level: 'Beginner',
    icon: Icons.solar_power,
  ),
  Course(
    title: 'Coding for Good',
    description:
        'Use beginner-friendly programming to build small apps that solve '
        'real community problems in education and health.',
    duration: '6 weeks',
    level: 'Intermediate',
    icon: Icons.code,
  ),
  Course(
    title: 'Climate Action Essentials',
    description:
        'Understand climate change, its causes and the everyday actions that '
        'learners can take.',
    duration: '2 weeks',
    level: 'Beginner',
    icon: Icons.eco,
  ),
  Course(
    title: 'Data Skills for Impact',
    description:
        'Collect, read and visualise simple data to track learning progress '
        'and measure results.',
    duration: '5 weeks',
    level: 'Intermediate',
    icon: Icons.bar_chart,
  ),
  Course(
    title: 'Inclusive Learning Design',
    description:
        'Discover how to create study material that is accessible to every '
        'learner, regardless of ability or background.',
    duration: '3 weeks',
    level: 'Advanced',
    icon: Icons.accessibility_new,
  ),
];

// ------------------------------------------------------------
// App root: theme + first screen
// ------------------------------------------------------------
class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kDeepBlue,
          secondary: kTeal,
        ),
        scaffoldBackgroundColor: kLightBg,
        appBarTheme: const AppBarTheme(
          backgroundColor: kDeepBlue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// ============================================================
// SCREEN 1: LOGIN
// ============================================================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Validate the form, then push the Home screen with the username
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      _passwordController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(username: username)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kDeepBlue, kTeal],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 36,
                        backgroundColor: kTeal,
                        child:
                            Icon(Icons.school, size: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Student Portal',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kDeepBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Learn. Grow. Succeed.',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username / Email',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your username or email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _hidePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(_hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () =>
                                setState(() => _hidePassword = !_hidePassword),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: kDeepBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: _handleLogin,
                          icon: const Icon(Icons.login),
                          label: const Text('Login'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Link to the Sign Up screen
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: kTeal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SCREEN 2: SIGN UP
// ============================================================
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Validators ------------------------------------------------
  String? _validateUsername(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please choose a username';
    if (text.length < 3) return 'Username must be at least 3 characters';
    return null;
  }

  String? _validateEmail(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please enter your email address';
    final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailPattern.hasMatch(text)) return 'Enter a valid email address';
    return null;
  }

  String? _validatePassword(String? value) {
    final text = value ?? '';
    if (text.isEmpty) return 'Please create a password';
    if (text.length < 6) return 'Password must be at least 6 characters';
    if (!RegExp(r'[0-9]').hasMatch(text)) {
      return 'Include at least one number';
    }
    return null;
  }

  // Validate, then REPLACE the sign-up screen with Home so the
  // back button returns to Login (not to the sign-up form).
  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final email = _emailController.text.trim();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(username: username, email: email),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kDeepBlue, kTeal],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 34,
                        backgroundColor: kTeal,
                        child: Icon(Icons.person_add_alt_1,
                            size: 36, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Join the Learning Community',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: kDeepBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Start your learning journey today',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _usernameController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: _validateUsername,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: _validateEmail,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _hidePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          helperText: 'Min. 6 characters, include a number',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            tooltip: _hidePassword
                                ? 'Show password'
                                : 'Hide password',
                            icon: Icon(_hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () =>
                                setState(() => _hidePassword = !_hidePassword),
                          ),
                        ),
                        validator: _validatePassword,
                        onFieldSubmitted: (_) => _handleSignUp(),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: kDeepBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: _handleSignUp,
                          icon: const Icon(Icons.how_to_reg),
                          label: const Text('Create Account'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: kTeal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SCREEN 3: HOME (dashboard)
// Stateful because it stores the courses the learner enrolled in,
// which come back from the Courses screen via a callback.
// ============================================================
class HomeScreen extends StatefulWidget {
  final String username; // data received from Login / Sign Up
  final String email; // optional, only set after Sign Up

  const HomeScreen({super.key, required this.username, this.email = ''});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Titles of courses the student has enrolled in
  final List<String> _enrolledCourses = [];

  // Called by the Courses screen whenever enrollment changes
  void _updateEnrollment(List<String> updated) {
    setState(() {
      _enrolledCourses
        ..clear()
        ..addAll(updated);
    });
  }

  void _openCourses() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoursesScreen(
          username: widget.username,
          enrolledCourses: List<String>.from(_enrolledCourses),
          onEnrollmentChanged: _updateEnrollment,
        ),
      ),
    );
  }

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(
          username: widget.username,
          email: widget.email,
          enrolledCount: _enrolledCourses.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        automaticallyImplyLeading: false, // we provide our own Logout button
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pop(context), // back to Login
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Welcome banner
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [kDeepBlue, kTeal]),
            ),
            child: Row(
              children: [
                const Icon(Icons.waving_hand, color: Colors.amber, size: 40),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back, ${widget.username}!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Keep learning, keep growing.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            'Learning Snapshot',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kDeepBlue,
            ),
          ),
          const SizedBox(height: 12),

          // Metric cards
          Row(
            children: const [
              Expanded(
                child: MetricCard(
                  icon: Icons.menu_book,
                  value: '6',
                  label: 'Accessible Lessons',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(
                  icon: Icons.public,
                  value: '1.2M',
                  label: 'Global Learners',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: MetricCard(
                  icon: Icons.bookmark_added,
                  value: '${_enrolledCourses.length}',
                  label: 'My Enrolled Courses',
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: MetricCard(
                  icon: Icons.volunteer_activism,
                  value: 'Free',
                  label: 'Open Access Learning',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kDeepBlue,
            ),
          ),
          const SizedBox(height: 12),

          // Navigation buttons
          SizedBox(
            height: 52,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: kDeepBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: _openCourses,
              icon: const Icon(Icons.library_books),
              label: const Text('Browse Courses'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 52,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: kTeal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: _openProfile,
              icon: const Icon(Icons.account_circle),
              label: const Text('My Profile'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 52,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red.shade700,
                side: BorderSide(color: Colors.red.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () => Navigator.pop(context), // return to Login
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable dashboard metric card (StatelessWidget)
class MetricCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const MetricCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: kTeal),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kDeepBlue,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SCREEN 4: COURSES
// ============================================================
class CoursesScreen extends StatefulWidget {
  final String username;
  final List<String> enrolledCourses; // data passed forward from Home
  final ValueChanged<List<String>> onEnrollmentChanged; // data passed back

  const CoursesScreen({
    super.key,
    required this.username,
    required this.enrolledCourses,
    required this.onEnrollmentChanged,
  });

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  late List<String> _enrolled;

  @override
  void initState() {
    super.initState();
    _enrolled = List<String>.from(widget.enrolledCourses);
  }

  // Add a course to the enrolled list and notify Home
  void _enroll(Course course) {
    if (!_enrolled.contains(course.title)) {
      setState(() => _enrolled.add(course.title));
      widget.onEnrollmentChanged(List<String>.from(_enrolled));
    }
  }

  // Simple detail view as a bottom sheet
  void _showCourseDetails(Course course) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        final alreadyEnrolled = _enrolled.contains(course.title);
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: kTeal.withOpacity(0.15),
                    child: Icon(course.icon, color: kTeal, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      course.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kDeepBlue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    avatar: const Icon(Icons.schedule, size: 18),
                    label: Text(course.duration),
                  ),
                  Chip(
                    avatar: const Icon(Icons.signal_cellular_alt, size: 18),
                    label: Text(course.level),
                  ),
                  const Chip(
                    avatar: Icon(Icons.volunteer_activism, size: 18),
                    label: Text('Free'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(course.description, style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: alreadyEnrolled ? Colors.grey : kDeepBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: alreadyEnrolled
                      ? null
                      : () {
                          _enroll(course);
                          Navigator.pop(sheetContext); // close the sheet
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Enrolled in ${course.title}!'),
                            ),
                          );
                        },
                  icon: Icon(alreadyEnrolled ? Icons.check : Icons.add),
                  label:
                      Text(alreadyEnrolled ? 'Already Enrolled' : 'Enroll Now'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Micro-Courses')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hi ${widget.username}, pick a free course to start learning:',
                style: const TextStyle(fontSize: 15, color: kDeepBlue),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: kCourses.length,
              itemBuilder: (context, index) {
                final course = kCourses[index];
                final isEnrolled = _enrolled.contains(course.title);
                return Card(
                  elevation: 3,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(14),
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: kTeal.withOpacity(0.15),
                      child: Icon(course.icon, color: kTeal),
                    ),
                    title: Text(
                      course.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kDeepBlue,
                      ),
                    ),
                    subtitle: Text('${course.duration}  •  ${course.level}'),
                    trailing: isEnrolled
                        ? const Icon(Icons.check_circle, color: kTeal)
                        : const Icon(Icons.chevron_right),
                    onTap: () => _showCourseDetails(course),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: kDeepBlue,
                  side: const BorderSide(color: kDeepBlue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () => Navigator.pop(context), // back to Home
                icon: const Icon(Icons.home),
                label: const Text('Back to Home'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SCREEN 5: PROFILE
// ============================================================
class ProfileScreen extends StatelessWidget {
  final String username; // from Login / Sign Up (via Home)
  final String email; // optional, only set after Sign Up
  final int enrolledCount; // from Home

  const ProfileScreen({
    super.key,
    required this.username,
    this.email = '',
    required this.enrolledCount,
  });

  // Simulated student ID derived from the username
  String get _studentId => 'STU-${1000 + username.length * 37}';

  // Badge level grows with the number of enrolled courses
  String get _badgeTitle {
    if (enrolledCount >= 4) return 'Champion Learner';
    if (enrolledCount >= 2) return 'Achiever';
    return 'New Learner';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: kDeepBlue,
                    child: Text(
                      getInitials(username),
                      style: const TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kDeepBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    avatar: const Icon(Icons.workspace_premium,
                        color: Colors.amber, size: 20),
                    label: Text(_badgeTitle),
                    backgroundColor: kTeal.withOpacity(0.15),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _infoTile(Icons.badge, 'Student ID', _studentId),
          if (email.isNotEmpty) _infoTile(Icons.email_outlined, 'Email', email),
          _infoTile(Icons.menu_book, 'Enrolled Courses', '$enrolledCount'),
          _infoTile(
              Icons.flag, 'Learning Goal', 'Learn something new every day'),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: kDeepBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () => Navigator.pop(context), // back to Home
              icon: const Icon(Icons.home),
              label: const Text('Back to Home'),
            ),
          ),
        ],
      ),
    );
  }

  // Helper that builds one profile detail row
  Widget _infoTile(IconData icon, String title, String value) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: kTeal),
        title: Text(title, style: const TextStyle(fontSize: 13)),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kDeepBlue,
          ),
        ),
      ),
    );
  }
}
