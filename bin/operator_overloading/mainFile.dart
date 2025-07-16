// File to make main function for Rectangle object.
import 'dart:convert';
import 'rectangle.dart';

void main(List<String> args) {
  // Call named optional default parameterized constructor of Rectangle with default values. 
  Rectangle rect1 = Rectangle();
  print("Rect1 : $rect1");

  // Call named optional default parameterized constructor of Rectangle with user defined values. 
  Rectangle rect2 = Rectangle(h: 9, w: 5);
  print("Rect2 : $rect2");

  // Call named constructor of Rectangle which accepts json String.
  Rectangle rect3 =
      Rectangle.fromJson('{"id1": "box1", "height": 4, "width":5}');
  print("Rect3 : $rect3");
  
  // Call named constructor of Rectangle which accepts Map of String of dynamic.
  Rectangle rect4 = Rectangle.fromMap({"id1": "box1", "height": 3, "width": 7});
  print("Rect4 : $rect4");
  
  // Call named constructor of Rectangle. First we convert map into String by using jsonEncode and then we pass that String in named constructor of Rectangle which accepts json String. 
  var map = {
    "Name": "Cube_box",
    "Cerial_No": 2341,
    "height": 10,
    "area": 160,
    "width": 6
  };
  Rectangle rect5 = Rectangle.fromJson(jsonEncode(map));
  print("Rect5 : $rect5");
}
