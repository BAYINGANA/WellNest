import 'package:flutter/material.dart';
import 'package:wellnest/screens/login_screen.dart';
import 'package:wellnest/services/database_service.dart';
import 'package:wellnest/models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final DatabaseService _dbService = DatabaseService();

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      try {
        // Create a new user
        final user = User(
          fullName: _fullNameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Save user data to SQLite
        await _dbService.registerUser(user);

        // Navigate to the login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup failed: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              _buildHeader(),
              _buildForm(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  /// Top wavy shape + "Create Account" text
  Widget _buildHeader() {
    return Stack(
      children: [
        // Top wavy shape
        ClipPath(
          clipper: TopCircularClipper(),
          child: Container(
            height: 220,
            width: double.infinity,
            color: ThemeConstants.lightBlue.withValues(alpha: 0.7),
            child: ClipPath(
              clipper: TopCircularClipper(),
              child: Container(
                color: ThemeConstants.lighterBlue,
              ),
            ),
          ),
        ),
        // "Create Account" text
        Positioned(
          left: 30,
          bottom: 30,
          child: Text(
            'Create Account',
            style: ThemeConstants.titleStyle,
          ),
        ),
      ],
    );
  }

  /// Main form with Full Name, Email, Password, Confirm Password fields
  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Full Name
            TextFormField(
              controller: _fullNameController,
              decoration: ThemeConstants.inputDecoration('Full Name').copyWith(
                prefixIcon: const Icon(Icons.person_outline, color: Colors.grey),
              ),
              style: ThemeConstants.inputStyle,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            const SizedBox(height: 22),
            // Email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: ThemeConstants.inputDecoration('Email').copyWith(
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
              ),
              style: ThemeConstants.inputStyle,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 22),
            // Password
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: ThemeConstants.inputDecoration('Password').copyWith(
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
              ),
              style: ThemeConstants.inputStyle,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 22),
            // Confirm Password
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration:
              ThemeConstants.inputDecoration('Confirm Password').copyWith(
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
              ),
              style: ThemeConstants.inputStyle,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 40),
            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _signUp, // Call the _signUp method here
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFA1EEBD),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: ThemeConstants.buttonStyle,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // "Login Instead" text
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: ThemeConstants.loginTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7827E6),
                      ),
                    ),
                    TextSpan(
                      text: ' Instead',
                      style: ThemeConstants.loginTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Bottom wavy shape (optional)
  Widget _buildFooter() {
    return Stack(
      children: [
        ClipPath(
          clipper: BottomCircularClipper(),
          child: Container(
            height: 160,
            width: double.infinity,
            color: ThemeConstants.lightBlue.withValues(alpha: 0.7),
            child: ClipPath(
              clipper: BottomCircularClipper(),
              child: Container(
                color: ThemeConstants.lighterBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}