// Use of class modifier: Sealed
// No Objects, No extends, No implements outside the file/package/library.
// It can extends and implements inside same file. But no object inside the file too.
// It's child classes have objects both inside and outside the file.
// You cannot create an object of a sealed class directly because sealed class is implicitely abstract or it's designed to be used only via its known childclass(subclasses), as their subclasses are not implicitely abstract so we can construct their objects outside the file.
// You cannot extend or implement a sealed class outside its file because the purpose of sealed is to restrict all subclassing to the same file, allowing the compiler to know all possible subtypes of the sealed class — this is essential for things like exhaustive(abnormal) switch statements.
// Sealed class child classes can have objects inside and outside the file because once we make the child classes of sealed class (inside the file), those child classes are public and normal, they can be instantiated anywhere or passed in functions.
// This allows you to control the type hierarchy while still exposing the allowed types to the outside world.. and keep hiding the classes that are not allowed like sealed class.
// In short we use sealed when we want to have all the children of a parent class to be in the same file, so that the compiler knows that all the children of this sealed parent class are present in this same file. Or in other words:
// "Here is the full list of allowed types that can extend this base class — no one else is allowed to add more outside this file."

// We can not construct the object of sealed class as bydefault it is abstract. 
// University university = University();

// The class 'University' can't be extended, implemented, or mixed in outside of its library because it's a sealed.
// class IUB extends University {
//   @override
//   void feeStructure() {
//     // TODO: implement feeStructure
//   }
// }

//The class 'University' can't be extended, implemented, or mixed in outside of its library because it's a sealed.
// class Fast implements University {
//   @override
//   void admissions() {
//     // TODO: implement admissions
//   }

//   @override
//   void feeStructure() {
//     // TODO: implement feeStructure
//   }
// }

// This is sealed Vehicle class of this file.
sealed class Vehicle {}

// Child classes of Vehicle sealed class.
class Car extends Vehicle {}

class Truck implements Vehicle {}

class Bicycle extends Vehicle {}

// ERROR: Can't be instantiated.
// Vehicle myVehicle = Vehicle();

// Subclasses can be instantiated.
Vehicle myCar = Car();

String getVehicleSound(Vehicle vehicle) {
  // ERROR: The switch is missing the Bicycle subtype or a default case.
  // return switch (vehicle) {
  //   Car() => 'Car',
  //   Truck() => 'Truck',  
  // };

  // Now it is correct. Even the switch has no default case even then it is not exhaustive (show no error). 
  // As compiler know that there is no other case for Vehicle type because it is sealed class.
  return switch (vehicle) {
    Car() => 'car',
    Truck() => 'truck',
    Bicycle() => 'bicycle'
  };
}