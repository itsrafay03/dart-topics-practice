// Simple Class of Student to make Named constructor of this class.
// The named constructor of this class is called in mainFile.dart file.

import 'dart:convert';

class Worker {
  int? age;
  String? name;

  // As we have public nullable fields so we can use them in Named optional parameter constructor.
  Worker({this.name, this.age});

  // Named Constructors:
  // Named constructor that takes a JSON string
  Worker.fromJson(String json) : this.fromMap(jsonDecode(json));
  // Named constructor that takes a map
  Worker.fromMap(Map<String, dynamic> map) : this(name: map['name'], age: map['age']);
  // It's further details are as following.
  
  // toString method.
  @override
  String toString() {
    return "Age: $age, Name: $name";
  }
}


// ✅ What Does this(...) Mean in Constructors?
// In this context, this(...) is a redirecting constructor call. It means:
// "Don't execute anything here, just call another constructor of this class with these parameters."

// Explanation:
// Worker.fromJson(String json) : this.fromMap(jsonDecode(json));
// This calls the named constructor: Worker.fromMap(...)
// this.fromMap(...) refers to: Worker.fromMap(Map<String, dynamic> map)
// ➤ Worker.fromMap(Map<String, dynamic> map) : this(name: map['name'], age: map['age']);
// Now this calls the default constructor: Worker({this.name, this.age});
// ✅ So this line uses this(...) to redirect to the default constructor by providing named arguments.

