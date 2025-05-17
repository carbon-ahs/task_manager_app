import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TaskManagerScreen(),
    );
  }
}

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  int _completedTasks = 0; // State variable for completed tasks
  bool _isFirstLoad = true; // Flag for didChangeDependencies

  @override
  void initState() {
    super.initState();
    print('Widget Initialized');
    // Initialize state here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Dependencies Changed');
    // Simulate loading initial counter value
  }

  @override
  Widget build(BuildContext context) {
    // build() is called whenever setState() triggers a UI rebuild
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager copy')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Completed Tasks: $_completedTasks',
              style: const TextStyle(fontSize: 36),
            ),
            // Add conditional text, buttons, and (optionally) TextField/ListView here
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('Widget Disposed');
    // Clean up resources here
    super.dispose();
  }
}
