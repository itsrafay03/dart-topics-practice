import 'border.dart';
import 'shape.dart';
import 'duration.dart' as d;
// This file has a main function to construct and execute the objects of Border and Shape class.

void main(List<String> args) {
  Border border1 = Border(BorderType.singleBorder);
  Border border2 = Border(BorderType.singleBorder);
  Border border3 = Border(BorderType.singleBorder);
  Border border4 = Border(BorderType.singleBorder);
  // If we did not implement Factory Design Pattern in Border class then above 4 different objects of Border class will form and each object have same data in it but just they have 4 memory blocks occupied.
  // But as we implement Factory Design Pattern in Border class so when every we construct Border object with singleBorder then it refer the already made object in memory. So in above case all 4 references are refering to single object in memory.

  print('Shapes');
  Shape rect = Shape(Shapes.rectangle);
  Shape circle = Shape(Shapes.circle);
  Shape triangle = Shape(Shapes.triangle);
  Rectangle rectangle = Shape(Shapes.rectangle) as Rectangle;
  // We need to cast because child class can not have a reference of parent class.

// How can we call the constructor of Shape class as it is an abstract class?
// You cannot instantiate an abstract class directly using a generative constructor, But you can define and call a factory constructor inside an abstract class.
// A factory constructor doesn’t necessarily create a new object of the class, it can return an object of any class, including its subclasses.
// Shape triangle = Shape(Shapes.triangle); This factory returns an instance of a child class, so no object of Shape is actually created, and Dart allows this.
// The result is an object of type Triangle, but stored in a variable of type Shape. That's how you're able to return child objects from an abstract parent class using the factory constructor.
// In current logic very time a new object of a child class is constructed from factory constructor of parent class.

// Here above we import our custome Duration class is import as 'd'.
  d.Duration duration = const d.Duration();
  print(duration.hours);
  print(duration.minutes);
  print(duration.seconds);
  // duration.minutes = 23;  // Show error at minutes because it's fields are constant which can not be change. 

  // Orignal class of Duration.
  Duration durat = const Duration();
}
