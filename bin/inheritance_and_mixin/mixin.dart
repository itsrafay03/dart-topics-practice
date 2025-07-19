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
// Constructors in mixin as mixins are composable units and cannot be instantiated, so constructors are meaningless and not allowed.
// Mixin extending a class as mixins must not have a superclass other than Object to ensure clean code reuse without inheritance conflicts.
// Mixin using with to include other mixins as mixin can't use with because composition is only allowed in classes; mixins must use extends to build on each other.

// Here is a Mixin of Cart and all the things which can be possible in Mixin.
mixin Cart{
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

class Vehicle{
  String? company;
}

class Car extends Vehicle with Cart, Roof{
  // We can access all the members of Vehicle, Roof, Cart from the object of Car class in main.
}






