import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teerapat/SelectedTodoScreen.dart';
import 'todo_provider.dart'; // นำเข้า TodoProvider

class MainTodoScreen extends StatelessWidget {
  const MainTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('รายการสิ่งที่ต้องทำของคุณ',
            style: GoogleFonts.krub(
              fontSize: 25,
              color: Colors.white,
            )),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // เปิดหน้าจอสำหรับเลือก To-Do ใหม่
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectTodoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: todoProvider.userSelectedTodos.isEmpty
          ? Center(
              child: Text(
                'ไม่มีรายการสิ่งที่ต้องทำ. โปรดเลือกสิ่งที่ต้องทำ',
                style: GoogleFonts.krub(
                  fontSize: 20,
                  color: Colors.red, // สีของข้อความ
                ),
                strutStyle: const StrutStyle(
                  height: 1.5, // กำหนดความสูงของบรรทัดถ้าต้องการ
                ),
              ),
            )
          : ListView.builder(
              itemCount: todoProvider.userSelectedTodos.length,
              itemBuilder: (context, index) {
                final userTodo = todoProvider.userSelectedTodos[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/${userTodo.imageName}',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(userTodo.title, style: GoogleFonts.krub()),
                    subtitle:
                        Text(userTodo.description, style: GoogleFonts.krub()),
                    trailing: IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        todoProvider.completeTodoAndRemove(userTodo);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
