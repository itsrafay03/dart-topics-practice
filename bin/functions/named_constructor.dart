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

  // Old Technique without constructor redirecting to make named constructors for above case.
  Worker.fromJasonOld(String json){
    var map = jsonDecode(json);
    name = map['name'];
    age = map['age'];
  }

  Worker.fromMapOld(Map<String, dynamic> map){
    name = map['name'];
    age = map['age'];
  } 
  
  // toString method.
  @override
  String toString() {
    return "Name: $name, Age: $age";
  }
}


// ✅ What Does this(...) Mean in Constructors?
// In this context, this(...) is a redirecting constructor call. It means:
// "Don't execute anything here, just call another constructor of this class with these parameters."

// Explanation:
// jsonDecode(String json) returns a Dart object representing the JSON structure and the exact type depends on what's inside the JSON, like List<Map<String, dynamics>> or Map<String, dynamics>.
// Generally Json representing string is Map<String, dynamic>.
// Worker.fromJson(String json) : this.fromMap(jsonDecode(json));
// This calls the named constructor: Worker.fromMap(...)
// this.fromMap(...) refers to: Worker.fromMap(Map<String, dynamic> map)
// ➤ Worker.fromMap(Map<String, dynamic> map) : this(name: map['name'], age: map['age']);
// Now this calls the default constructor: Worker({this.name, this.age});
// ✅ So this line uses this(...) to redirect to the default constructor by providing named arguments.
// In short the call stack works like this:
// . fromJson parses the JSON into a Map.
// . Then calls this.fromMap(...) (constructor redirection)
// . fromMap(...) reads the values from the map and calls the main constructor.
// fromJson(json String)
//     ↓
// fromMap(Map)
//     ↓
// Worker({name, age})


// Cerilization: Dart Object(Map, List, e.t.c) --> Json String 
// De-Cerilization: Json String --> Dart Object(Map, List, e.t.c) 
// We give Json string to jsonDecode and it create it's Dart Object(Map<String, dynamic>), so it is decertlization.
// We give Dart Object(Map<String, dynamic>) to jsonEncode and it create it's Json string, so it is certlization.