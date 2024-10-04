import 'package:flutter/material.dart';
import 'screens/offers_screen.dart';
import 'screens/product_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/single_item.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ORYX App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductScreen(), // Set SplashScreen as the starting screen
    );
  }
}


// import 'package:flutter/material.dart';
// import 'services/dark_light_theme.dart';
// import 'services/orientation_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isDarkTheme = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Dark/Light Theme',
//       theme: _isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme,
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Screen"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("Welcome to the Dark/Light Theme App"),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to OrientationScreen
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => const OrientationScreen(),
//                 ));
//               },
//               child: const Text("Go to Orientation Screen"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
