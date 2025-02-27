import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/screens/login_screen.dart';

/// A complete, single-file implementation of the Register Screen
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

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The overall screen
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
            ),
            const SizedBox(height: 40),
            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen(),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: ThemeConstants.lightGreen,
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
                    builder: (context) =>
                        LoginScreen(),
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

/// Clipper for the top wavy shape
class TopCircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Clipper for the bottom wavy shape
class BottomCircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      size.height * 0.2,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Centralized theme/colors/text styles
class ThemeConstants {
  static const Color primaryPurple = Color(0xFF7472E0);
  static const Color darkBlue = Color(0xFF242364);
  static const Color lightGreen = Color(0xFFA1EEBD);
  static const Color lightBlue = Color(0xFFF0F8FF);
  static const Color lighterBlue = Color(0xFFE6F3FF);

  static TextStyle get titleStyle => GoogleFonts.inriaSans(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: darkBlue,
  );

  static TextStyle get inputStyle => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle get buttonStyle => GoogleFonts.inriaSans(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: darkBlue,
  );

  static TextStyle get loginTextStyle => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  /// Default outline input decoration
  static InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: inputStyle.copyWith(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: primaryPurple, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: primaryPurple, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: primaryPurple, width: 2),
      ),
    );
  }
}
