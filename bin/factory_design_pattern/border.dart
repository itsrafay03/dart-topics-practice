// This file is made to implement another example of Factory Design Pattern.
// In this order class we only have 4 scnerios of constructor so that's why we make these constructors Non-generative so that every time the respective object of particular constructor is used instead of making another new object.
// So this is memory effecient approch because by using Singleton patter we have only 4 objects in memory otherwise if we make the generative constructors of order class then we have as many objects as many constructors call.

class Border {
  // It is a datamember. 
  String borderType;
  
  // Now we will make a map in which key is BorderType and value is Borderclass object.
  static final Map<BorderType, Border> _cache = {
    BorderType.noBorder:
        Border._internal(borderType: BorderType.noBorder.toString()),
    BorderType.singleBorder:
        Border._internal(borderType: BorderType.singleBorder.toString()),
    BorderType.doubleBorder:
        Border._internal(borderType: BorderType.doubleBorder.toString()),
    BorderType.threeDBorder:
        Border._internal(borderType: BorderType.threeDBorder.toString()),
  };

  // It is a Generative Constructor of Border class. But it is private so we can only access it within this file, not outside the file.
  Border._internal({required this.borderType});

  // It is a Non-generative(Factory) Constructor of Border class. In this Singleton is implemented, as everytime already made objects are used.
  // This constructor we will call when we want to create the object of Border class in other file.
  factory Border(BorderType borderType) {
    return _cache[borderType]!;
  }
}

// An enum is a special data type that allows you to define a fixed set of named constants. All these constants belong to the same type, which is the enum itself.
// Below datatype of enum is 'BorderType'. Now everytime when we take borderType then we get one of the following constant values so it is memory efficient, error free approch.
enum BorderType {
  noBorder,
  singleBorder,
  doubleBorder,
  threeDBorder,
}

// Let's discuss how the above code works:

// The enum type is `BorderType`, which defines four fixed constants:
// noBorder, singleBorder, doubleBorder, and threeDBorder.

// In the `Border` class, we have a data member `borderType` of type `String`.

// Then we define a static and final Map<BorderType, Border> named `_cache`.
// `static` means it belongs to the class itself, not any instance.
// `final` ensures that the reference to the map cannot be changed (although its contents can still be modified). Also the main reason that in map we are calling constructor which call at runtime so that's why we use 'final' instead of 'const'.
// The reason we make it static is because we want to return instances from this map inside the factory constructor — and factory constructors **cannot access instance members**, only static ones.

// The `_cache` map stores **exactly one object** for each `BorderType`, using a private named constructor `Border._internal(...)` to create those objects initially.

// The constructor `Border._internal` is a private **generative constructor** that actually creates an object. It takes a named parameter `borderType`, and it's only used internally within the class to populate the cache.

// The `factory Border(BorderType)` constructor is a **non-generative (factory) constructor**. 
// It receives a `BorderType` value in parameter and returns the corresponding Border object from the map `_cache`, as in return statement we are writing _map[key] which give a value of this key. 
// That value is a object of Border class. This way, we avoid creating new objects repeatedly — instead, we reuse the same pre-built instances.

// This implementation follows the **Singleton design pattern**, customized for a finite set of possible instances.
// It improves **memory efficiency** and ensures that the same instance is reused for each border type.


