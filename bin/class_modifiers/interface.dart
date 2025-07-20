import 'class_modifiers.dart';
// Use of class modifier: Interface
// It can not allow a class to extends outside a file/library/package.
// It is construct object and implements outside the file.


// Object of Interface class can be constructed outside the file.
Animal animal = Animal();

// Interface class can only be implemented in other file.
class Lion implements Animal{
  @override
  void hunting() {
    // TODO: implement hunting
  }
}

// Interface class can not extends in other file.
// class Cat extends Animal {}   // Show Error

// Actual Concept:
// So what I understand is that In base class we can only extend it outside the file which give us choise to override some methods of base class and make changes. Due to those changes or so called specialize implimentation the logic of rest of the methods or internal methods of base class maight be change or expose via extends that someone might override. 
// Interface class doesn’t allow extending it outside, but allows implementing it. When someone implements it, they must override all methods. So logic is in the hands of the user now. If you use implements, you are not reusing any logic from the original class — you are writing everything yourself. So there's no risk of "accidentally breaking" internal behavior.
// Since the user implements all methods themselves, they’re not depending on or changing the internal logic of the original class — they’re building their own version.
// Analogy: base class = You gave someone a working car, and they can modify parts of it (like the engine). But if they mess it up, the rest of the car might fail. Interface class = You gave someone just the blueprint. They have to build their own car from scratch — you don’t care how they implement it, as long as they follow the rules (methods) you gave.

// So when to use base and when to use interface class modiifers.
// Outside file we can only extends base class. If I want users to reuse my class behavior(methods) but only in a controlled way(means not changing the internal functions logic and code implimentation), then use base.
// Outside file we can only implements interface class. If I want users to give their own implimentation of all the methods of my class without exposing internal logic of my class (means just they have to follow a methods structure/signature that defined in class but give their own functionality), then we use interface. 


