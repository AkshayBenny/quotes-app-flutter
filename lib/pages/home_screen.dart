import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/widgets/bottom_nav_bar.dart';
import 'package:quotes_app_flutter/widgets/home_screen_main_widget.dart';
import 'package:quotes_app_flutter/widgets/home_screen_top_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> quotes = [
    "You define your own life. Do not let others define it for you.",
    "Life is what happens when you're busy making other plans.",
    "Get busy living or get busy dying.",
  ];

  @override
  void initState() {
    super.initState();
    fetchQuotesAndLog(); // Call the function here
  }

  Future<void> fetchQuotesAndLog() async {
    try {
      FirebaseFirestore.instance
          .collection('quotes')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // Note: Make sure the field name here matches your Firestore collection
          print(doc["test"]); // Fix the field name to "text"
        });
      }).catchError((error) {
        print("Error fetching quotes: $error");
        print("---------------------------ERROR-------------------------");
      });
    } catch (error) {
      print("-----------------------------ERROR-------------------------");
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const HomeScreenTopBarWidget(),
      ),
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
