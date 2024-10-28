class Todo {
  String title;
  String description;
  String imageName;
  bool isCompleted;

  Todo({
    required this.title,
    required this.description,
    required this.imageName,
    this.isCompleted = false, // กำหนดค่าเริ่มต้นให้เป็น false
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      description: json['description'],
      imageName: json['imageName'],
      isCompleted:
          false, // ตั้งค่า isCompleted ให้เป็น false ทุกครั้งที่สร้างจาก JSON
    );
  }
}
