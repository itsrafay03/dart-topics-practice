// This file is made to understand the concept of Mixin in Dart.
// Mixin is a type in Dart like class and record.
// We make Mixin of those entities whose individual objects are not useful so they must have to mix with other objects.
// like roof in a car, cart of a vehicle.
// Allowed:
// Class can mix multiple mixins (class MyClass with MixinA, MixinB {})
// Mixin can extend another mixin (mixin MixinB extends MixinA { ... })
// Mixin can implement an interface (mixin MyMixin implements Interface {})
// Mixin can be constrained using 'on' (mixin Bark on Animal {})
// Mixin can have (Instance variables, Static constants, Static methods, Instance methods, getters/setters)
// Not Allowed:
// Constructors in mixin as mixins are composable units and cannot be instantiated, so constructors are meaningless and not allowed. Mixin do not have any implicit or explicit constructors.
// Mixin extending a class as mixins must not have a superclass other than Object to ensure clean code reuse without inheritance conflicts.
// Mixin using with to include other mixins as mixin can't use with because composition is only allowed in classes; mixins must use extends to build on each other.

// Here is a Mixin of Cart and all the things which can be possible in Mixin.
mixin Cart on Vehicle{
  // Instance variable in mixin.
  int maxload = 0;
  // Static constant in mixin.
  static const String material = 'steel';
  // Static method in mixin.
  static foo(){}
  // Non-static(Instance) method in mixin.
  soo(){} 
  // property(getter/setter)
  num _value = 99;
  num get value => _value;
  set value(num number) => _value = number;
}

// Another Mixin of Roof.
mixin Roof{
  int size = 0;
}

// Vehicle class as a parent class of Car class.
class Vehicle{
  String? company;
}

// car class as a child class of Vehicle class and mix with two mixins.
class Car extends Vehicle with Cart, Roof{
  // We can access all the members of Vehicle, Roof, Cart from the object of Car class in main function below.
}

// We can restrict the mixin that you can mix with only this class and child classes of this class, not mix with other classes.
// As we make simple Cart mixin 'on Vehicle' so now it will only mix with Vehicle or it's child classes like Car. As we seen above.
// But now if we want tp mix Cart mixin with Animal class it will show error as below. 
// class Animal with Cart {}

// One mixin can implements another mixin.
mixin FlyingCart implements Roof{}

// We can implements the Mixin on class. But we must have to override the members of Mixin in that class. Because here mixin is acting like interface.
class Foo implements Roof {
  @override
  late int size;
}

// Error because classes only extends with only classes, not extends with mixins.
// class Soo extends Roof {}

// If we implements Car class with any other class then we have to must override the members of Vehicle, Cart and Roof.
// As done following, just we add 'late' keyword with every datamember as to tell compiler that we will tell their value later on. 
class Koo implements Car {
  @override
  late num _value;

  @override
  String? company;

  @override
  late int maxload;

  @override
  late int size;

  @override
  late num value;

  @override
  soo() {
    // TODO: implement soo
    throw UnimplementedError();
  }
}

// When you use a mixin in Dart, the compiler injects/copies the mixin's members (methods and variables) directly into the class that uses it.
// There is no separate mixin object created — it's just as if the mixin’s code is copied into the class at compile time.
// It's  not like we studied in inheritance that parent object is formed in child's object and then we can access parent members from child object. 

// main function.
void main(List<String> args) {
  // Car class object so that we can see how members of Mixin(Cart, Roof) and inheriated class(Vehicle) are accessed here.
  Car car = Car();
  car.company;  // member of Vehicle class.
  car.maxload;  // member of Cart Mixin.
  car.size;  // member of Roof Mixin.

  // As mixin is like inheritance(not exactly inheritance) so it has same advantages reusability of code and generalization.
  // Here Roof is acting as a parent of Car so it can keep the reference of child object as discussed below.
  // Also now from 'roof' we can only access member of Roof only as it happen in inheritance that roof required the reference of that object whose metadata is like Roof. 
  Roof roof = Car();
  roof.size;
  // roof.maxload;   // show error 

  // Constructors of Mixins are not allowed.
  // Cart cart = Cart();   // Error

}
