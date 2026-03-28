import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/utils/theme/appTheme.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 80, color: AppThemes.grey),
            const Text(
              "No Internet Connection",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700, // Use FontWeight constants
                  fontSize: 16,
                ),
              ),
              child: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
