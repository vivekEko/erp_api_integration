// In your logout screen, use the AuthService to log out the user and remove the token from the global state management solution.
import 'package:erp_v1/modals/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_v1/services/auth_service.dart';

class LogoutScreen extends StatelessWidget {
  void _logout(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final token = Provider.of<User>(context, listen: false).token;

    try {
      await authService.logout(token);
      Provider.of<User>(context, listen: false).setUser(null);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _logout(context),
          child: Text('Logout'),
        ),
      ),
    );
  }
}
