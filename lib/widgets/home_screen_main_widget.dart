import 'package:flutter/material.dart';

class HomeScreenMainWidget extends StatefulWidget {
  const HomeScreenMainWidget({super.key, required this.quote});

  final String quote;

  @override
  State<HomeScreenMainWidget> createState() => _HomeScreenMainWidgetState();
}

class _HomeScreenMainWidgetState extends State<HomeScreenMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(),
        Text(
          '"${widget.quote}"',
          style: const TextStyle(
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
    );
  }
}
