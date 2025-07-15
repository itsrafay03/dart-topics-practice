// This file is made to implement another Factory Design Pattern as discussed in register.
// This shape class will act as Parent class. And we want to construct the child's object from the constructor of this parent class.
// Shape class is a Abstract class so we can not make it's object explicitely by calling it's constructor.
abstract class Shape {
  // private named constructor of Shape class.
  Shape._internal();
  
  // Factory constructor of Shape class.
  // Every time a new object is created of child class as we are calling constructor. If you want Singleton implementation then make factory constructor as made in Border class.
  factory Shape(Shapes shape) {
    return switch (shape) {
      Shapes.rectangle => Rectangle._internal(),
      Shapes.circle => Circle._internal(),
      Shapes.triangle => Triangle._internal(),
    };
  }
}

// Below classes we can make in different files but we made here so it's okay as they all are child classes of Shape class.
// And we have to call parent class constructor in child classes using 'super' becuase constructor of parent class is not default, it is private named constructor.

class Rectangle extends Shape {
  // Below is a private named constructor of the child class Rectangle, which uses constructor chaining to call the private named constructor of the parent class Shape through the initialization list.
  Rectangle._internal() : super._internal();
}

class Circle extends Shape {
  // Below is a private named constructor of the child class Circle, which uses constructor chaining to call the private named constructor of the parent class Shape through the initialization list.
  Circle._internal() : super._internal();
}

class Triangle extends Shape {
  // Below is a private named constructor of the child class Triangle, which uses constructor chaining to call the private named constructor of the parent class Shape through the initialization list.
  Triangle._internal() : super._internal();
}

// In these child classes we make their constructors private just to enforce that only the factory method can call them. And these constructors are only accessible within a file.
// We make them named to readability and flexability when calling constructors of child class and separate them from constructor overloading(which is not allowed in Dart).
// Why is super._internal() called in the initialization list, instead of the body of constructor like Triangle._internal(){super._internal()}
// Because in Dart, the superclass constructor must be called before the subclass body runs. So as we know that statements in initilization list executes before the body of constructor executes,
// So Dart requires that if you're calling a superclass constructor, it must be done in the initialization list. like;  ChildConstructor() : super();

// Enum of Shapes.
enum Shapes {
  rectangle,
  circle,
  triangle,
}
