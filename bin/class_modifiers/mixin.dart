import 'class_modifiers.dart';
// Use of class modifier: Mixin class
// Here it is a class with mixin access modifier. It is different from 'mixin' which is a type like class or enum. So do not mix mixin class with mixin.
// We have discussed mixin already in 'inheritance_and_mixin' folder. SO here we will only discuss mixin class.
// A mixin class declaration defines a class that is usable as both a regular class and a mixin, with the same name and the same type. As class extends and mixin with, so we can do both with mixin class.
// Mixin class will have all the facilities and restrictions of both mixin and class.
// A mixin class is a hybrid between a regular class and a mixin.
// It behaves like a class (can have constructors to construct object of mixin class and be extended, or implements as an interface)
// It can also be used as a mixin (mixed into another class with with)
// We can extends, implements and with(mix) our class by mixin class within a class and outside of the file. 

mixin class Musician {
  // maixin class do not have abstract methods.
  // void foo();    // Show Error.

  // mixin class only have concrete methods.
  void dancePerformance(){}
}

// We can also construct the object of mixin class.
Musician musician = Musician();

// Use Musician as a mixin.
class Novice with Musician {}

// Use Musician as a class.
class Rock extends Musician {}

// Use Musician as an interface because in dart class is also a primary interface.
class Rocks implements Musician {
  @override
  void dancePerformance() {
    // TODO: implement dancePerformance
  }
}

// As mixins can't have extends or with clauses, so neither can a mixin class.

// Simple class.
class Mma {} 
// mixin class can not extends another class.
// mixin class Wrestler extends Mma{}   // Show error.

// Simple mixin.
mixin SamboPlayer{}
// mixin class can not mix with another class.
// mixin class JujitsuPlayer with SamboPlayer{}   // Show error.

// Classes can't have an on clause, so neither can a mixin class.
// mixin class Grapling on Mma{}    // Show error.
