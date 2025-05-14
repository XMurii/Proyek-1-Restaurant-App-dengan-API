import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek_1_restaurant_app_dengan_api/provider/main/index_nav_provider.dart';
import 'package:proyek_1_restaurant_app_dengan_api/screens/bookmark/bookmark_screen.dart';
import 'package:proyek_1_restaurant_app_dengan_api/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNavbar) {
            0 => const HomeScreen(),
            _ => const BookmarkScreen(),
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavbar,
        onTap: (index) {
          context.read<IndexNavProvider>().setIndextBottomNavbar = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks),
            label: "Bookmarks",
            tooltip: "Bookmarks",
          ),
        ],
      ),
    );
  }
}
