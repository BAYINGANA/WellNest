import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/screens/home_screen.dart';
import 'package:wellnest/screens/signup_screen.dart';
import 'package:wellnest/services/database_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class ThemeConstants {
  static const Color primaryPurple = Color(0xFF7472E0);
  static const Color darkBlue = Color(0xFF242364);
  static const Color lightGreen = Color(0xFFA1EEBD);
  static const Color lightBlue = Color(0xFFF0F8FF);
  static const Color lighterBlue = Color(0xFFE6F3FF);
  static const Color signUpPurple = Color(0xFF7827E6);

  static TextStyle get titleStyle => GoogleFonts.inriaSans(
    fontSize: 33,
    fontWeight: FontWeight.w700,
    color: darkBlue,
  );

  static TextStyle get inputStyle => GoogleFonts.inter(
    fontSize: 12,
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

  static InputDecoration inputDecoration(String hint, {IconData? icon}) {
    return InputDecoration(
      prefixIcon: icon == null ? null : Icon(icon, color: Colors.black),
      hintText: hint,
      hintStyle: inputStyle.copyWith(color: Colors.black54),
      contentPadding: const EdgeInsets.symmetric(horizontal: 55, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: primaryPurple,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: primaryPurple,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: primaryPurple,
          width: 2,
        ),
      ),
    );
  }
}

class TopCircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 150);
    path.quadraticBezierTo(size.width / 2, 200, size.width, 150);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomCircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 20);
    path.quadraticBezierTo(size.width / 2, -30, size.width, 20);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final DatabaseService _dbService = DatabaseService();

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // Check if the user exists in SQLite
      final user = await _dbService.loginUser(email, password);

      if (user != null) {
        // Navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
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

  /// Top curved area with “Login” text
  Widget _buildHeader() {
    return Stack(
      children: [
        // First curve
        ClipPath(
          clipper: TopCircularClipper(),
          child: Container(
            height: 250,
            width: double.infinity,
            color: ThemeConstants.lightBlue.withValues(alpha: 0.71),
            child: ClipPath(
              clipper: TopCircularClipper(),
              child: Container(
                color: ThemeConstants.lighterBlue,
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Login',
                      style: ThemeConstants.titleStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Email + Password fields + Buttons
  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 27),
            TextFormField(
              controller: _emailController,
              decoration: ThemeConstants.inputDecoration(
                'Email',
              ).copyWith(
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
              ),
              style: ThemeConstants.inputStyle,
              keyboardType: TextInputType.emailAddress,
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
            TextFormField(
              controller: _passwordController,
              decoration: ThemeConstants.inputDecoration(
                'Password',
              ).copyWith(
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
              ),
              style: ThemeConstants.inputStyle,
              obscureText: true,
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
            const SizedBox(height: 48),

            // Login button
            SizedBox(
              width: 311,
              child: TextButton(
                onPressed: _signIn, // Call the _signIn method here
                style: TextButton.styleFrom(
                  backgroundColor: ThemeConstants.lightGreen,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Login',
                  style: ThemeConstants.buttonStyle,
                ),
              ),
            ),

            const SizedBox(height: 21),

            // Create account text
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Create Account ',
                      style: ThemeConstants.loginTextStyle,
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: ThemeConstants.loginTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ThemeConstants.signUpPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }

  /// Bottom curved shape
  Widget _buildFooter() {
    return Stack(
      children: [
        ClipPath(
          clipper: BottomCircularClipper(),
          child: Container(
            height: 177,
            width: double.infinity,
            color: ThemeConstants.lightBlue.withValues(alpha: 0.71),
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