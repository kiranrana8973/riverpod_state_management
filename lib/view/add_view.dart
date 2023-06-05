import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/logic/arithmetic.dart';

class AddView extends ConsumerStatefulWidget {
  const AddView({super.key});

  @override
  ConsumerState<AddView> createState() => _AddViewState();
}

class _AddViewState extends ConsumerState<AddView> {
  final firstNoController = TextEditingController();
  final secondNoController = TextEditingController();

  int result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First number',
            ),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Second number',
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              int first = int.parse(firstNoController.text);
              int second = int.parse(secondNoController.text);
              var arithmetic = ref.read(arithmeticProvider);
              setState(() {
                result = arithmetic.add(first, second);
              });
            },
            child: const Text('Add'),
          ),
          const SizedBox(height: 8),
          Text('Result is: $result'),
        ],
      ),
    );
  }
}
