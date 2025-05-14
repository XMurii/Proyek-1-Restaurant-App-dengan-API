import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek_1_restaurant_app_dengan_api/data/api/api_services.dart';
import 'package:proyek_1_restaurant_app_dengan_api/provider/home/restaurant_list_provider.dart';
import 'package:proyek_1_restaurant_app_dengan_api/provider/main/index_nav_provider.dart';
import 'package:proyek_1_restaurant_app_dengan_api/screens/main/main_screen.dart';
import 'package:proyek_1_restaurant_app_dengan_api/static/navigation_route.dart';
import 'package:proyek_1_restaurant_app_dengan_api/style/theme/restaurant_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IndexNavProvider()),
        Provider(create: (context) => ApiServices()),
        ChangeNotifierProvider(
          create:
              (context) => RestaurantListProvider(context.read<ApiServices>()),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Restaurant App",
      theme: RestaurantTheme.lightTheme,
      darkTheme: RestaurantTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {NavigationRoute.mainRoute.name: (context) => const MainScreen()},
    );
  }
}
