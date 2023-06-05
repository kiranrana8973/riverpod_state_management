import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/app/config_reader.dart';
import 'package:riverpod_state_management/app/environment.dart';
import 'package:riverpod_state_management/view/add_view.dart';
import 'package:riverpod_state_management/view/counter_view.dart';
import 'package:riverpod_state_management/view/dashboard_view.dart';
import 'package:riverpod_state_management/view/student_view.dart';

// void main() {
//   runApp(
//     ProviderScope(
//       child: MaterialApp(
//         title: 'Riverpod state management',
//         initialRoute: '/',
//         routes: {
//           '/': (context) => const DashboardView(),
//           '/counter': (context) => const CounterView(),
//           '/add': (context) => const AddView(),
//           '/studentView': (context) => const StudentView(),
//         },
//       ),
//     ),
//   );
// }
Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory
  await ConfigReader.initialize();

  late Color primaryColor;
  switch (env) {
    case Environment.dev:
      primaryColor = Colors.blue;
      break;
    case Environment.prod:
      primaryColor = Colors.red;
      break;
  }

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Riverpod state management',
        initialRoute: '/',
        routes: {
          '/': (context) => DashboardView(color: primaryColor),
          '/counter': (context) => const CounterView(),
          '/add': (context) => const AddView(),
          '/studentView': (context) => const StudentView(),
        },
      ),
    ),
  );
}
