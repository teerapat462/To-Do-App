import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart'; // นำเข้า TodoProvider

class SelectTodoScreen extends StatelessWidget {
  const SelectTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final availableTodos = todoProvider.availableTodos;

    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกรายการสิ่งที่ต้องทำ', style: GoogleFonts.krub()),
        backgroundColor: Colors.teal,
      ),
      body: availableTodos.isEmpty
          ? Center(
              child: Text(
                'ไม่มีรายการสิ่งที่ต้องทำให้เลือก',
                style: GoogleFonts.krub(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: availableTodos.length,
              itemBuilder: (context, index) {
                final todo = availableTodos[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/${todo.imageName}',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(todo.title, style: GoogleFonts.krub()),
                    subtitle: Text(todo.description, style: GoogleFonts.krub()),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        todoProvider.addTodo(todo);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
