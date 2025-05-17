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
  final TextEditingController _textFieldController = TextEditingController();
  final List<String> _tasks = [];

  @override
  void initState() {
    super.initState();
    print('Widget Initialized');
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
      appBar: AppBar(title: const Text('Task Manager')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Completed Tasks: $_completedTasks',
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 16),
            Text(
              _completedTasks == 0
                  ? 'No tasks completed yet'
                  : 'You have completed $_completedTasks tasks',
              style: TextStyle(
                color: _completedTasks == 0 ? Colors.red : Colors.green,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                  labelText: 'Enter Task Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _onAddPressed,
                  child: const Text(
                    'Add',
                  ),
                ),
                ElevatedButton(
                  onPressed: _onClearPressed,
                  child: Text(
                    'Clear',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_tasks[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    print('Widget Disposed');
    super.dispose();
  }

  void _onAddPressed() {
    setState(() {
      _tasks.add(_textFieldController.text);
      _completedTasks++;
      _textFieldController.clear();
    });
  }

  void _onClearPressed() {
    setState(
      () {
        _completedTasks = 0;
        _textFieldController.clear();
        _tasks.clear();
      },
    );
  }
}
