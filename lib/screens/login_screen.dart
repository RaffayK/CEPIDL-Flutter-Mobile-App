import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  bool _obscureText = true;
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/login_image1.png",
                      fit: BoxFit.cover),
                  const SizedBox(height: 20),
                  Text(
                    "Stay Blooming $_username",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    onSaved: (value) => _username = value ?? '',
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter username'
                        : null,
                    onChanged: (value) {
                      _username = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    onSaved: (value) => _password = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    child: InkWell(
                      onTap: () async => await moveToHome(),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: 50,
                        width: changeButton ? 50 : 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(
                            changeButton ? 100 : 50,
                          ),
                        ),
                        child: changeButton
                            ? const Icon(Icons.done, color: Colors.white)
                            : const Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Replace '/signup' with your actual signup route
                    },
                    child: Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "CEPIDL APP",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/notification.svg"),
          onPressed: () {
            // Handle notification icon press
          },
        ),
      ],
    );
  }
}

extension _LoginScreenStateExtension on _LoginScreenState {
  Future<void> moveToHome() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        changeButton = false;
      });
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
