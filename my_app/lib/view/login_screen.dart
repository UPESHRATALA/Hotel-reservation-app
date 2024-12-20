import 'package:flutter/material.dart';
import 'package:my_app/view/register_screen.dart';
import 'package:my_app/core/common/snackbar/my_snackbar.dart'; // Import the SnackBar utility
import 'home_screen.dart'; // Import the HomeScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ensures the container fills the screen width
        height:
            double.infinity, // Ensures the container fills the screen height
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 300,
                ),
                SizedBox(height: 25),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField(
                        Icons.email,
                        "Email",
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9]+@[a-zA0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      _buildTextField(
                        Icons.lock,
                        "Password",
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black
                          ,
                          padding: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // If form is valid, show success SnackBar
                            SnackBarUtil.showSnackBar(
                                context, "Login Successful",
                                backgroundColor: Colors.green);
                            // Navigate to HomeScreen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          } else {
                            // If form is not valid, show error SnackBar
                            SnackBarUtil.showSnackBar(
                                context, "Please fill in all fields correctly");
                          }
                        },
                        child: Text("Sign In"),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "or sign in using",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.facebook)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.email)),
                        ],
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText,
      {bool obscureText = false,
      TextEditingController? controller,
      FormFieldValidator<String>? validator}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blue),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
