import 'package:flutter/material.dart';
import 'package:riverpod_state_management/view/add_view.dart';
import 'package:riverpod_state_management/view/counter_view.dart';
import 'package:riverpod_state_management/view/dashboard_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Riverpod state management',
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardView(),
        '/counter': (context) => const CounterView(),
        '/add': (context) => const AddView(),
      },
    ),
  );
}
