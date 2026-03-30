import 'package:flutter/material.dart';

void main() => runApp(const LoginApp());

// --- MODEL ---
class Login {
  final String user;
  final String password;
  Login(this.user, this.password); }

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

// --- TELA DE LOGIN ---
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'), 
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const FlutterLogo(size: 100),
            const SizedBox(height: 40),
            const LoginForm(), 
            const SizedBox(height: 20),
            const Text('New User? Create Account', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  void _validarLogin() {
    if (_userController.text == 'admin' && _passController.text == '1234') {
      Navigator.pushNamed(context, '/home'); // 
    } else {
      // Feedback de erro via SnackBar [cite: 16, 24, 25, 35]
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Falha no login: credenciais incorretas'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField( 
          controller: _userController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: _passController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Forgot Password', style: TextStyle(color: Colors.blue)), 
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            onPressed: _validarLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), 
              ),
            ),
            child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)), // 
          ),
        ),
      ],
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter By Example'), 
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: FlutterLogo(size: 300), 
      ),
      floatingActionButton: FloatingActionButton( 
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.star, color: Colors.white), 
      ),
    );
  }
}