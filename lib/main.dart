import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teerapat/todomainscreen.dart';
import 'todo_provider.dart'; // นำเข้า TodoProvider

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ทำให้ Flutter สามารถเรียกใช้ async
  final todoProvider = TodoProvider();
  await todoProvider.loadTodosFromJson(); // โหลด To-Do จาก JSON ก่อนเริ่มแอป

  runApp(
    ChangeNotifierProvider(
      create: (context) => todoProvider, // สร้าง ChangeNotifierProvider
      child: const MyApp(), // เรียกใช้ MyApp
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.krubTextTheme(
          Theme.of(context).textTheme.apply(displayColor: Colors.black),
        ),
      ),
      home: const MainTodoScreen(), // เรียกใช้ MainTodoScreen เป็นหน้าหลัก
    );
  }
}
