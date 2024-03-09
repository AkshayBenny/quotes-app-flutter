import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,  
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Quotes.",
              style: TextStyle(color: Colors.white),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.offline_bolt_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.apps_sharp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            const Text(
              '"You define your own life. Do not let anyone else define it for you."',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Add space between text and button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                    backgroundColor: Colors.white.withOpacity(0.12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Icon(Icons.favorite), // Add text color
                ),
                const SizedBox(
                  width: 24,
                ),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(42, 12, 42, 12),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Share",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      backgroundColor: Colors.white.withOpacity(0.12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Icon(Icons.favorite),
                ),
                
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
