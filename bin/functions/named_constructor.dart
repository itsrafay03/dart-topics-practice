// Simple Class of Student to make Named constructor of this class.
// The named constructor of this class is called in mainFile.dart file.

import 'dart:convert';
import 'dart:ffi';

class Worker {
  int? age;
  String? name;

  // As we have public nullable fields so we can use them in Named optional parameter constructor.
  Worker({this.age, this.name});

  // Named Constructor
  Worker.fromJson(String json) : this.fromMap(jsonDecode(json));
  Worker.fromMap(Map<String, dynamic> map) : this(name: map['name'], age: map['age']);

  // toString method.
  @override
  String toString() {
    return "Age: $age, Name: $name";
  }
}
