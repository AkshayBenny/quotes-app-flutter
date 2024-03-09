import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/widgets/bottom_nav_bar.dart';
import 'package:quotes_app_flutter/widgets/home_screen_main_widget.dart';
import 'package:quotes_app_flutter/widgets/home_screen_top_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  
  final List<String> quotes = [
    "You define your own life. Do not let others define it for you.",
    "Life is what happens when you're busy making other plans.",
    "Get busy living or get busy dying.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const HomeScreenTopBarWidget()),
      body: PageView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: HomeScreenMainWidget(quote: quotes[index]),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
