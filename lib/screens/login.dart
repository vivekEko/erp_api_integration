// In your login screen, use the AuthService to authenticate the user and store the token in a global state management solution such as Provider.
import 'package:erp_v1/modals/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_v1/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _login(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final username = usernameController.text;
    final password = passwordController.text;

    try {
      final user = await authService.login(username, password);
      Provider.of<User>(context, listen: false).setUser(user);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
